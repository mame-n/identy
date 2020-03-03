require 'dicom'

include DICOM

class Identy
  def initialize
    @dcm_path = ARGV[0] ? ARGV[0] : "./DicomFiles"
    @dcm_path = File.expand_path(@dcm_path)
    puts "dcm_path #{@dcm_path}"
  end

  def main
    keep_dir = Dir.pwd
    Dir.chdir(@dcm_path)
    ret = dcm_dirs
    Dir.chdir(keep_dir)
    convert_cvs( ret )
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

  def dbg_chdir(dpath)
    Dir.chdir(dpath)
  end

end
