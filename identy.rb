require "DICOM"
#require "C:/Program Files (x86)/mybin/patient_name_id"
#require "./patient_name_id"

class Identy
  def initialize( argvs )
    check_argvs( argvs )
    @results = []
    @dbg_folder_paths = []
  end

  def check_argvs( argvs )
    if argvs.size == 0
      puts_usage
      @dcm_folder = nil
    
    elsif argvs.size == 1
      @dcm_folder = argvs[0]
    end
  end


  def puts_usage
    puts "No input file path is specified."
    puts "usage: ruby identy <Folder name>"
  end

  def main
    @dcm_path = File.expand_path(@dcm_folder)

#    keep_dir = Dir.pwd

    @out_file = @dcm_path + "/dicom_info.txt"
    puts "Output file #{@out_file}"

#    Dir.chdir(@dcm_path)
    ret = convert_cvs( dcm_dirs( @dcm_path ).flatten )
    write_cvs( ret )
    Dir.chdir(keep_dir)
    ret
  end

  attr_accessor :dcm_folder, :results, :dbg_folder_paths

  def dcm_dirs( folder_path )

    Dir.each_child( folder_path ).each do |file_name|
      puts "File name is #{file_name}"
      next if file_name == "DICOMDIR"

      file_path = folder_path + "/" + file_name

      if File.file?(file_path)
        puts "#{file_path}"
        dcm = DICOM::DObject.read( file_path )
        if dcm.read?
          @results << [ dcm["0010,0010"].value, dcm["0010,0020"].value, dcm["0008,0020"].value, folder_path ]
          puts "Result update #{@results}"
          return 
        else
          # Non DICOM file. Just through this file
        end          

      elsif Dir.exist?(file_path)
        puts "#{file_path} is folder"; @dbg_folder_paths << file_path
        dcm_dirs( file_path )

      else
#        [nil,nil,nil,nil,idx(file_path)]
      end
    end
  end

  def idx(d_dir)
    d_dir.split("/").map { |each_path| each_path }
  end

  def convert_cvs(dcm_results)
    dcm_results.uniq!
#    puts "Before #{dcm_results}"
    dcm_results.inject(["Patient name,Patient ID,Study Date,DCM File name,DCM path"]) do |result_text, dcm_result|
#      puts "result_text = #{result_text} : #{dcm_result}"
      if dcm_result[0] == nil  # PID is nil , so this file is not DICOM.
        result_text
      else
        result_text << change_string(dcm_result)
      end
    end
  end

  def change_string(dcm_result)
    p dcm_result
    dcm_result.flatten.inject("") do |gather_text, d|
      gather_text + (d + ",")
    end.delete_suffix(",")
  end

  def gather_nil(targets)
    targets.inject([]) do |gathered, target|
      next if target[1] == nil # PID == nil, this file is not DICOM.
      gathered << target 
    end
  end

  def dbg_chdir(dpath)
    Dir.chdir(dpath)
  end

  def write_cvs( values )
    File.open(@out_file, "w") do |fp|
      values.each do |value|
        fp.puts(value)
      end
    end
  end
end

if $0 == __FILE__
  Identy.new(ARGV[0]).main
end
