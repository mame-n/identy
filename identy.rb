require 'dicom'

include DICOM

class Identy
  def initialize
    @dcm_path = ARGV[0] ? ARGV[0] : "./DicomFiles"
    @dcm_path = File.expand_path(@dcm_path)
    
  end

  def main
    keep_dir = Dir.pwd
    Dir.chdir(dcm_path)
    ret = dcm_dirs
    Dir.chdir(keep_dir)
    convert_cvs( ret )
  end

  def contents_from_dcm(dcm_file)
    dcm = DObject.read(dcm_file)
    [dcm.value("0010,0010"), dcm.value("0010,0020"), dcm.value("0008,0020")]
  end

  def dcm_dirs
    Dir.glob("**/*/").inject({}) do |contents, d_dir|
      puts "1: con #{contents}, dir #{d_dir}"

      if d_dir.split("/")[1] 
#      next if d_dir.empty?
        puts "2: con #{contents}, dir #{d_dir}"

        contents[idx(d_dir)] = [] unless contents.include?(idx(d_dir))
        contents[idx(d_dir)] << all_files(@dcm_path+"/"+idx(d_dir))
      end
      contents = {}
    end
  end

  def all_files(fpath)
    Dir.glob(fpath+"/*").map do |dcm_file|
      next if File.directory?(dcm_file)
      contents_from_dcm(dcm_file)
    end
  end

  def idx(d_dir)
    d_dir.split("/")[1]
  end

  def dbg_chdir(dpath)
    Dir.chdir(dpath)
  end

end
