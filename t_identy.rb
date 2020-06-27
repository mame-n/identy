require "test/unit"
require "./identy.rb"

class TC < Test::Unit::TestCase
  def setup
    @obr = Identy.new(["../DicomReplicant/DicomReplicant"])
  end

  def test_initialize
    dcm = "DCMNAME"
    Identy.new([])
    obr = Identy.new([dcm])
    assert_equal( dcm, obr.dcm_folder )
  end

  def test_main
    assert_equal(
      ["Patient name,Patient ID,Study Date,DCM File name,DCM path",
        "EM,Z1,20170316,IM00002,Vitrea-20180713102058,DICOM,ST00001,SE00023,IM00002",
        "EM,Z1,20170316,IM00003,Vitrea-20180713102058,DICOM,ST00001,SE00023,IM00003",
        "EM,Z1,20170316,IM00004,Vitrea-20180713102058,DICOM,ST00001,SE00023,IM00004",
        "EM,Z1,20170316,IM00001,Vitrea-20180713102058,DICOM,ST00001,SE00023,IM00001",
        "EM,Z1,20170316,IM00002,Vitrea-20180713102058,DICOM,ST00001,SE00012,IM00002",
        "EM,Z1,20170316,IM00003,Vitrea-20180713102058,DICOM,ST00001,SE00012,IM00003",
        "EM,Z1,20170316,IM00004,Vitrea-20180713102058,DICOM,ST00001,SE00012,IM00004",
        "EM,Z1,20170316,IM00001,Vitrea-20180713102058,DICOM,ST00001,SE00012,IM00001",
        "EM,Z1,20170316,IM00002,Vitrea-20180713102058,DICOM,ST00001,SE00015,IM00002",
        "EM,Z1,20170316,IM00003,Vitrea-20180713102058,DICOM,ST00001,SE00015,IM00003",
        "EM,Z1,20170316,IM00004,Vitrea-20180713102058,DICOM,ST00001,SE00015,IM00004",
        "EM,Z1,20170316,IM00001,Vitrea-20180713102058,DICOM,ST00001,SE00015,IM00001",
        "EM,Z1,20170316,IM00002,Vitrea-20180713102058,DICOM,ST00001,SE00014,IM00002",
        "EM,Z1,20170316,IM00003,Vitrea-20180713102058,DICOM,ST00001,SE00014,IM00003",
        "EM,Z1,20170316,IM00001,Vitrea-20180713102058,DICOM,ST00001,SE00014,IM00001",
        "EM,Z1,20170316,IM00002,Vitrea-20180713102058,DICOM,ST00001,SE00022,IM00002",
        "EM,Z1,20170316,IM00003,Vitrea-20180713102058,DICOM,ST00001,SE00022,IM00003",
        "EM,Z1,20170316,IM00001,Vitrea-20180713102058,DICOM,ST00001,SE00022,IM00001",
        "EM,Z1,20170316,IM00002,Vitrea-20180713102058,DICOM,ST00001,SE00007,IM00002",
        "EM,Z1,20170316,IM00003,Vitrea-20180713102058,DICOM,ST00001,SE00007,IM00003",
        "EM,Z1,20170316,IM00004,Vitrea-20180713102058,DICOM,ST00001,SE00007,IM00004",
        "EM,Z1,20170316,IM00001,Vitrea-20180713102058,DICOM,ST00001,SE00007,IM00001",
        "EM,Z1,20170316,IM00002,Vitrea-20180713102058,DICOM,ST00001,SE00009,IM00002",
        "EM,Z1,20170316,IM00003,Vitrea-20180713102058,DICOM,ST00001,SE00009,IM00003",
        "EM,Z1,20170316,IM00001,Vitrea-20180713102058,DICOM,ST00001,SE00009,IM00001",
        "EM,Z1,20170316,IM00002,Vitrea-20180713102058,DICOM,ST00001,SE00008,IM00002",
        "EM,Z1,20170316,IM00003,Vitrea-20180713102058,DICOM,ST00001,SE00008,IM00003",
        "EM,Z1,20170316,IM00004,Vitrea-20180713102058,DICOM,ST00001,SE00008,IM00004",
        "EM,Z1,20170316,IM00001,Vitrea-20180713102058,DICOM,ST00001,SE00008,IM00001",
        "EM,Z1,20170316,IM00001,Vitrea-20180713102058,DICOM,ST00001,SE00001,IM00001",
        "EM,Z1,20170316,IM00002,Vitrea-20180713102058,DICOM,ST00001,SE00027,IM00002",
        "EM,Z1,20170316,IM00003,Vitrea-20180713102058,DICOM,ST00001,SE00027,IM00003",
        "EM,Z1,20170316,IM00004,Vitrea-20180713102058,DICOM,ST00001,SE00027,IM00004",
        "EM,Z1,20170316,IM00001,Vitrea-20180713102058,DICOM,ST00001,SE00027,IM00001",
        "EM,Z1,20170316,IM00002,Vitrea-20180713102058,DICOM,ST00001,SE00019,IM00002",
        "EM,Z1,20170316,IM00003,Vitrea-20180713102058,DICOM,ST00001,SE00019,IM00003",
        "EM,Z1,20170316,IM00004,Vitrea-20180713102058,DICOM,ST00001,SE00019,IM00004",
        "EM,Z1,20170316,IM00001,Vitrea-20180713102058,DICOM,ST00001,SE00019,IM00001",
        "EM,Z1,20170316,IM00002,Vitrea-20180713102058,DICOM,ST00001,SE00026,IM00002",
        "EM,Z1,20170316,IM00003,Vitrea-20180713102058,DICOM,ST00001,SE00026,IM00003",
        "EM,Z1,20170316,IM00004,Vitrea-20180713102058,DICOM,ST00001,SE00026,IM00004",
        "EM,Z1,20170316,IM00001,Vitrea-20180713102058,DICOM,ST00001,SE00026,IM00001",
        "EM,Z1,20170316,IM00002,Vitrea-20180713102058,DICOM,ST00001,SE00003,IM00002",
        "EM,Z1,20170316,IM00003,Vitrea-20180713102058,DICOM,ST00001,SE00003,IM00003",
        "EM,Z1,20170316,IM00004,Vitrea-20180713102058,DICOM,ST00001,SE00003,IM00004",
        "EM,Z1,20170316,IM00001,Vitrea-20180713102058,DICOM,ST00001,SE00003,IM00001",
        "EM,Z1,20170316,IM00002,Vitrea-20180713102058,DICOM,ST00001,SE00002,IM00002",
        "EM,Z1,20170316,IM00003,Vitrea-20180713102058,DICOM,ST00001,SE00002,IM00003",
        "EM,Z1,20170316,IM00004,Vitrea-20180713102058,DICOM,ST00001,SE00002,IM00004",
        "EM,Z1,20170316,IM00001,Vitrea-20180713102058,DICOM,ST00001,SE00002,IM00001",
        "EM,Z1,20170316,IM00002,Vitrea-20180713102058,DICOM,ST00001,SE00005,IM00002",
        "EM,Z1,20170316,IM00003,Vitrea-20180713102058,DICOM,ST00001,SE00005,IM00003",
        "EM,Z1,20170316,IM00004,Vitrea-20180713102058,DICOM,ST00001,SE00005,IM00004",
        "EM,Z1,20170316,IM00001,Vitrea-20180713102058,DICOM,ST00001,SE00005,IM00001",
        "CC,CC,20060714,US000001,US000001",
        "DeName-20180823.205517,DeId-20180823.205517,20180823,IM00002,Vitrea-20180826192330,DICOM,ST00001,SE00001,IM00002",
        "DeName-20180823.205517,DeId-20180823.205517,20180823,IM00001,Vitrea-20180826192330,DICOM,ST00001,SE00001,IM00001",
        "CC,CC,20060714,US000001.org,US000001.org",
        "20180824.145047.Name,20180824.145047.ID,20180824,IM00001,Vitrea-20180824151159,DICOM,ST00001,SE00001,IM00001",
        "20180824.145047.Name,20180824.145047.ID,20180824,IM00002,Vitrea-20180824151159,DICOM,ST00001,SE00003,IM00002",
        "20180824.145047.Name,20180824.145047.ID,20180824,IM00001,Vitrea-20180824151159,DICOM,ST00001,SE00003,IM00001",
        "20180824.145047.Name,20180824.145047.ID,20180824,IM00001,Vitrea-20180824151159,DICOM,ST00001,SE00002,IM00001",
        "USS-V2.5-171117-01 SPL.IMAGE LN^FOR USS44G  FN^MI,USS56-V2.5SP0001-SPL.IMAGE,20171208,A0000,DICOM,DATA,20171211,194331,A0000",
        "USS-V2.5-171117-01 SPL.IMAGE LN^FOR USS44G  FN^MI,USS56-V2.5SP0001-SPL.IMAGE,20171208,A0001,DICOM,DATA,20171211,194331,A0001"],
        @o.main)
  end

  def test_dcm_dirs
    obr = Identy.new(["DicomFiles"])
    obr.dcm_dirs( "/Users/shouichi/ruby/src/identy/DicomFiles/DICOM" )
    assert_equal(
      [["USS-V2.5-171117-01 SPL.IMAGE LN^FOR USS44G  FN^MI","USS56-V2.5SP0001-SPL.IMAGE", "20171208","/Users/shouichi/ruby/src/identy/DicomFiles/DICOM/DATA/20171211/194331"]], 
      obr.results )

    obr = Identy.new(["DicomFiles"])
    obr.dcm_dirs( "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058" )
    assert_equal(
      [["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00023"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00012"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00015"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00014"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00022"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00007"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00009"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00008"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00001"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00027"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00019"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00026"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00003"],
       ["DICOMKENSYO_Name",
        "DICOMKENSYO_002",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00002"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00005"]],
      obr.results
    )
    assert_equal( ["/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM",
      "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001",
      "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00001",
      "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00002",
      "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00003",
      "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00005",
      "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00007",
      "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00008",
      "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00009",
      "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00012",
      "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00014",
      "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00015",
      "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00019",
      "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00022",
      "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00023",
      "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00026",
      "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00027"], 
      obr.dbg_folder_paths.sort
    )
  end

  def test_convert_cvs
    obr = Identy.new(["DicomFiles"])
    assert_equal( ["Patient name,Patient ID,Study Date,DCM File name,DCM path", "DICOM,EM,Z1,20170316", "Foo,bar,ZZ,foofoo", "1,2,3,4"],
      obr.convert_cvs([["DICOM", "EM", "Z1", "20170316"],["Foo","bar","ZZ","foofoo"],["DICOM", "EM", "Z1", "20170316"],["1","2","3","4"]]))
  end

  def test_idx
    obr = Identy.new(["DicomFiles"])
    assert_equal(["foo","bar","fofofo.txt"], obr.idx("foo/bar/fofofo.txt"))
  end

  def test_gather_nil
    obr = Identy.new(["DicomFiles"])
    assert_equal( [["DICOM", nil, nil, nil]], obr.gather_nil([["DICOM", "EM", "Z1", "20170316"],["DICOM", nil, nil, nil]]))
  end

  def test_write_cvs
    obr = Identy.new(["DicomFiles"])
    assert_equal(nil, obr.write_cvs(["1,2,3,4","9,9,9,9"]))
  end

end
