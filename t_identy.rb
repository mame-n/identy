require "test/unit"
require "./identy.rb"

class TC < Test::Unit::TestCase
  def setup
    @o = Identy.new
  end

  def test_dcm_dirs
    @o.dbg_chdir("/Users/shouichi/ruby/src/identy/DicomFiles/DICOM/")
    assert_equal([["DATA", nil, nil, nil],
      ["DATA", nil, nil, nil],
      ["DATA", nil, nil, nil],
      ["DATA",
       "USS-V2.5-171117-01 SPL.IMAGE LN^FOR USS44G  FN^MI",
       "USS56-V2.5SP0001-SPL.IMAGE",
       "20171208"],
      ["DATA",
       "USS-V2.5-171117-01 SPL.IMAGE LN^FOR USS44G  FN^MI",
       "USS56-V2.5SP0001-SPL.IMAGE",
       "20171208"]], @o.dcm_dirs)
    @o.dbg_chdir("/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058")
    assert_equal([["DICOMDIR", nil, nil, nil],
      ["DICOM", nil, nil, nil],
      ["DICOM", nil, nil, nil],
      ["DICOM", nil, nil, nil],
      ["DICOM", "EM", "Z1", "20170316"],
      ["DICOM", "EM", "Z1", "20170316"],
      ["DICOM", "EM", "Z1", "20170316"],
      ["DICOM", "EM", "Z1", "20170316"],
      ["DICOM", nil, nil, nil],
      ["DICOM", "EM", "Z1", "20170316"],
      ["DICOM", "EM", "Z1", "20170316"],
      ["DICOM", "EM", "Z1", "20170316"],
      ["DICOM", "EM", "Z1", "20170316"],
      ["DICOM", nil, nil, nil],
      ["DICOM", "EM", "Z1", "20170316"],
      ["DICOM", "EM", "Z1", "20170316"],
      ["DICOM", "EM", "Z1", "20170316"],
      ["DICOM", "EM", "Z1", "20170316"],
      ["DICOM", nil, nil, nil],
      ["DICOM", "EM", "Z1", "20170316"],
      ["DICOM", "EM", "Z1", "20170316"],
      ["DICOM", "EM", "Z1", "20170316"],
      ["DICOM", nil, nil, nil],
      ["DICOM", "EM", "Z1", "20170316"],
      ["DICOM", "EM", "Z1", "20170316"],
      ["DICOM", "EM", "Z1", "20170316"],
      ["DICOM", nil, nil, nil],
      ["DICOM", "EM", "Z1", "20170316"],
      ["DICOM", "EM", "Z1", "20170316"],
      ["DICOM", "EM", "Z1", "20170316"],
      ["DICOM", "EM", "Z1", "20170316"],
      ["DICOM", nil, nil, nil],
      ["DICOM", "EM", "Z1", "20170316"],
      ["DICOM", "EM", "Z1", "20170316"],
      ["DICOM", "EM", "Z1", "20170316"],
      ["DICOM", nil, nil, nil],
      ["DICOM", "EM", "Z1", "20170316"],
      ["DICOM", "EM", "Z1", "20170316"],
      ["DICOM", "EM", "Z1", "20170316"],
      ["DICOM", "EM", "Z1", "20170316"],
      ["DICOM", nil, nil, nil],
      ["DICOM", "EM", "Z1", "20170316"],
      ["DICOM", nil, nil, nil],
      ["DICOM", "EM", "Z1", "20170316"],
      ["DICOM", "EM", "Z1", "20170316"],
      ["DICOM", "EM", "Z1", "20170316"],
      ["DICOM", "EM", "Z1", "20170316"],
      ["DICOM", nil, nil, nil],
      ["DICOM", "EM", "Z1", "20170316"],
      ["DICOM", "EM", "Z1", "20170316"],
      ["DICOM", "EM", "Z1", "20170316"],
      ["DICOM", "EM", "Z1", "20170316"],
      ["DICOM", nil, nil, nil],
      ["DICOM", "EM", "Z1", "20170316"],
      ["DICOM", "EM", "Z1", "20170316"],
      ["DICOM", "EM", "Z1", "20170316"],
      ["DICOM", "EM", "Z1", "20170316"],
      ["DICOM", nil, nil, nil],
      ["DICOM", "EM", "Z1", "20170316"],
      ["DICOM", "EM", "Z1", "20170316"],
      ["DICOM", "EM", "Z1", "20170316"],
      ["DICOM", "EM", "Z1", "20170316"],
      ["DICOM", nil, nil, nil],
      ["DICOM", "EM", "Z1", "20170316"],
      ["DICOM", "EM", "Z1", "20170316"],
      ["DICOM", "EM", "Z1", "20170316"],
      ["DICOM", "EM", "Z1", "20170316"],
      ["DICOM", nil, nil, nil],
      ["DICOM", "EM", "Z1", "20170316"],
      ["DICOM", "EM", "Z1", "20170316"],
      ["DICOM", "EM", "Z1", "20170316"],
      ["DICOM", "EM", "Z1", "20170316"]], @o.dcm_dirs)
  end

  def test_idx
    assert_equal("foo", @o.idx("foo/bar/fofofo.txt"))
  end

end
