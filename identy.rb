require 'dicom'

include DICOM

class Identy
  def initialize(dcm_path="./DicomFiles")
    puts "dcm_path 1 #{dcm_path}"
    @dcm_path = File.expand_path(dcm_path)
    puts "dcm_path 2 #{@dcm_path}"
  end

  def main
    keep_dir = Dir.pwd
    Dir.chdir(@dcm_path)
    ret = dcm_dirs
    Dir.chdir(keep_dir)
    puts convert_cvs( ret )
  end

  def dcm_dirs
    Dir.glob("**/*").map do |file_path|
      unless File.directory?(file_path)
        dcm = DObject.read("./" + file_path)
        [idx(file_path), dcm.value("0010,0010"), dcm.value("0010,0020"), dcm.value("0008,0020")]
      else
        [idx(file_path),nil,nil,nil]
      end
    end
  end

  def idx(d_dir)
    d_dir.split("/")[0]
  end

  def convert_cvs(dcm_result)
    dcm_result.uniq!
    dcm_result -= gather_nil(dcm_result)
    dcm_result.inject("") do |result_text, info|
      info.each do |d|
        result_text += (d + ",")
      end
      result_text += "\n"
    end
  end

  def gather_nil(targets)
    targets.inject([]) do |gathered, target|
      if target[1] == nil 
        gathered << target # if PID == nil, this file is not DICOM.
      else
        gathered = []
      end

    end
  end

  def dbg_chdir(dpath)
    Dir.chdir(dpath)
  end

end

if $0 == __FILE__
  Identy.new(ARGV[0]).main
end
