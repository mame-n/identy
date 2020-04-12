require "./patient_name_id"

class Identy
  def initialize(dcm_path="./DicomFiles")
    puts "dcm_path 1 #{dcm_path}"
    @dcm_path = File.expand_path(dcm_path)
    puts "dcm_path 2 #{@dcm_path}"
  end

  def main
    keep_dir = Dir.pwd
    @out_file = keep_dir+ARGV[2]
    Dir.chdir(@dcm_path)
    ret = dcm_dirs
    write_cvs(convert_cvs( ret ))
    Dir.chdir(keep_dir)
  end

  def dcm_dirs
    Dir.glob("**/*").map do |file_path|
      unless File.directory?(file_path)
        dcm = PatirntNameID.new("./" + file_path)
        [idx(file_path), dcm[:pname], dcm[:pid], dcm[:study_date]]
      else
        [idx(file_path),nil,nil,nil]
      end
    end
  end

  def idx(d_dir)
    d_dir.split("/")[0]
  end

  def convert_cvs(dcm_results)
    dcm_results.uniq!
    puts "Before #{dcm_results}"
    dcm_results.inject([]) do |result_text, dcm_result|
      puts "result_text = #{result_text} : #{dcm_result}"
      if dcm_result[1] == nil  # PID is nil , so this file is not DICOM.
        result_text
      else
        result_text << change_string(dcm_result)
      end
    end
  end

  def change_string(dcm_result)
    dcm_result.inject("") do |gather_text, d|
      gather_text + (d + ",")
    end.delete_suffix(",")
  end

  def gather_nil(targets)
    targets.inject([]) do |gathered, target|
      next if target[1] == nil # if PID == nil, this file is not DICOM.
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
