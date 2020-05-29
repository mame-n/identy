#require "C:/Program Files (x86)/mybin/patient_name_id"
require "./patient_name_id"

class Identy
  def initialize(dcm_path="./DicomFiles")
#    print "dcm_path #{dcm_path} -> "
    @dcm_path = File.expand_path(dcm_path)
#    puts "#{@dcm_path}"
  end

  def main
    keep_dir = Dir.pwd
    @out_file = keep_dir+"/dicom_info.txt"
    puts "Output file #{@out_file}"

    Dir.chdir(@dcm_path)
    ret = convert_cvs( dcm_dirs )
    write_cvs( ret )
    Dir.chdir(keep_dir)
    ret
  end

  def dcm_dirs
    Dir.glob("**/*").map do |file_path|
      unless File.directory?(file_path)
#        puts "#{file_path}"
        dcm = PatientNameID.new("./" + file_path).name_id
        if dcm
          [dcm[:pname], dcm[:pid], dcm[:study_date],dcm[:fname],idx(file_path)]
        else
          puts "!!!!!!"
#          [idx(file_path),nil,nil,nil]
        end          
      else
        [nil,nil,nil,nil,idx(file_path)]
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
