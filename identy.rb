require "DICOM"
#require "C:/Program Files (x86)/mybin/patient_name_id"
#require "./patient_name_id"

class Identy
  def initialize( argvs=[] )
    @dcm_path, @out_file = initialize_argvs( argvs )
    @results = []
    @dbg_folder_paths = []
  end

  def initialize_argvs( argvs )
    if argvs.size == 0
      puts_usage
      [nil,nil]
    
    elsif argvs.size >= 1
      dcm_path = File.expand_path( argvs[0] )
      out_file = dcm_path + "/dicom_info.txt"
      [dcm_path, out_file]
    end
  end

  def puts_usage
    puts "No input folder name is specified."
    puts "usage: ruby identy <Folder name>"
  end

  def main
#    keep_dir = Dir.pwd
#    Dir.chdir(@dcm_path)
    dcm_dirs( @dcm_path )
    ret = convert_cvs( @results )
#    ret = convert_cvs( dcm_dirs( @dcm_path ) )
    write_cvs( ret )
  end

  attr_accessor :dcm_path, :results, :dbg_folder_paths, :out_file

  def dcm_dirs( folder_path )

    Dir.each_child( folder_path ).each do |file_name|
      puts "File name is #{file_name}"
      next if file_name == "DICOMDIR"

      file_path = folder_path + "/" + file_name

      if File.file?(file_path)
        dcm = DICOM::DObject.read( file_path )
        if dcm.read?
          @results << [ dcm["0010,0010"].value, dcm["0010,0020"].value, dcm["0008,0020"].value, folder_path ]
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
    puts "@@@@@@@ #{dcm_results}"
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
    dcm_result.flatten.inject("") do |gather_text, d|
      gather_text + (d + ",")
    end.delete_suffix(",")
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
