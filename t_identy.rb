require "test/unit"
require "./identy.rb"

class TC < Test::Unit::TestCase
  def setup
    @o = Identy.new
  end

  def test_contents_from_dcm
    assert_equal( ["EM", "Z1", "20170316"], 
      @o.contents_from_dcm("/Users/shouichi/Ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00001/IM00001"))
  end

  def test_all_files
#    @o.dbg_chdir("/Users/shouichi/Ruby/src/identy/DicomFiles/DICOM/DATA/20171211/194331")
    fpath = "/Users/shouichi/Ruby/src/identy/DicomFiles/DICOM/DATA/20171211/194331"
    assert_equal( 
      [["USS-V2.5-171117-01 SPL.IMAGE LN^FOR USS44G  FN^MI",
      "USS56-V2.5SP0001-SPL.IMAGE",
      "20171208"],
      ["USS-V2.5-171117-01 SPL.IMAGE LN^FOR USS44G  FN^MI",
      "USS56-V2.5SP0001-SPL.IMAGE",
      "20171208"]],
      @o.all_files(fpath) )
    fpath = "/Users/shouichi/Ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00001"
    assert_equal([["EM", "Z1", "20170316"]], @o.all_files(fpath))
  end

  def test_dcm_dirs
    @o.dbg_chdir("/Users/shouichi/Ruby/src/identy")
    assert_equal(nil, @o.dcm_dirs)
  end

  def test_idx
    assert_equal("foo", @o.idx("foo/bar"))
  end

end
