require "test/unit"
require "./identy.rb"

class TC < Test::Unit::TestCase
  def setup
    @obr = Identy.new(["../DicomReplicant/DicomReplicant"])
  end

  def test_initialize_argvs
    obr = Identy.new()
    assert_equal( [nil,nil], obr.initialize_argvs([]) )
    assert_equal( ["/Users/shouichi/ruby/src/identy/dcm","/Users/shouichi/ruby/src/identy/dcm/dicom_info.txt"], obr.initialize_argvs(["dcm"]) )
    assert_equal( ["/Users/shouichi/ruby/src/DicomReplicant/DicomFiles", "/Users/shouichi/ruby/src/DicomReplicant/DicomFiles/dicom_info.txt"], 
      obr.initialize_argvs( ["../DicomReplicant/DicomFiles"] ) )
    obr = Identy.new(["../DicomReplicant/DicomFiles"])
    assert_equal("/Users/shouichi/ruby/src/DicomReplicant/DicomFiles", obr.dcm_path )
    assert_equal("/Users/shouichi/ruby/src/DicomReplicant/DicomFiles/dicom_info.txt", obr.out_file )
  end

  def test_main
    obr = Identy.new(["DicomFiles"])
    ret = obr.main
    assert_equal( ["Patient name,Patient ID,Study Date,DCM File name,DCM path",
      "USS-V2.5-171117-01 SPL.IMAGE LN^FOR USS44G  FN^MI,USS56-V2.5SP0001-SPL.IMAGE,20171208,/Users/shouichi/ruby/src/identy/DicomFiles",
      "EM,Z1,20170316,/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00023",
      "EM,Z1,20170316,/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00012",
      "EM,Z1,20170316,/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00015",
      "EM,Z1,20170316,/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00014",
      "EM,Z1,20170316,/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00022",
      "EM,Z1,20170316,/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00007",
      "EM,Z1,20170316,/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00009",
      "EM,Z1,20170316,/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00008",
      "EM,Z1,20170316,/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00001",
      "EM,Z1,20170316,/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00027",
      "EM,Z1,20170316,/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00019",
      "EM,Z1,20170316,/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00026",
      "EM,Z1,20170316,/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00003",
      "DICOMKENSYO_Name,DICOMKENSYO_002,20170316,/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00002",
      "EM,Z1,20170316,/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00002",
      "DICOMKENSYO_Name,DICOMKENSYO_003,20170316,/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00002",
      "DICOMKENSYO_Name,DICOMKENSYO_001,20170316,/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00002",
      "EM,Z1,20170316,/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00005",
      "DeName-20180823.205517,DeId-20180823.205517,20180823,/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180826192330/DICOM/ST00001/SE00001",
      "20180824.145047.Name,20180824.145047.ID,20180824,/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180824151159/DICOM/ST00001/SE00001",
      "20180824.145047.Name,20180824.145047.ID,20180824,/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180824151159/DICOM/ST00001/SE00003",
      "20180824.145047.Name,20180824.145047.ID,20180824,/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180824151159/DICOM/ST00001/SE00002",
      "USS-V2.5-171117-01 SPL.IMAGE LN^FOR USS44G  FN^MI,USS56-V2.5SP0001-SPL.IMAGE,20171208,/Users/shouichi/ruby/src/identy/DicomFiles/DICOM/DATA/20171211/194331"],
      ret )
    assert_equal( 
      ["/Users/shouichi/ruby/src/identy/DicomFiles/DICOM",
        "/Users/shouichi/ruby/src/identy/DicomFiles/DICOM/DATA",
        "/Users/shouichi/ruby/src/identy/DicomFiles/DICOM/DATA/20171211",
        "/Users/shouichi/ruby/src/identy/DicomFiles/DICOM/DATA/20171211/194331",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM",
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
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00027",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180824151159",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180824151159/DICOM",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180824151159/DICOM/ST00001",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180824151159/DICOM/ST00001/SE00001",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180824151159/DICOM/ST00001/SE00002",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180824151159/DICOM/ST00001/SE00003",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180826192330",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180826192330/DICOM",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180826192330/DICOM/ST00001",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180826192330/DICOM/ST00001/SE00001"],
      obr.dbg_folder_paths.sort )
  end

  def test_dcm_dirs
    obr = Identy.new(["DicomFiles"])
    obr.dcm_dirs( "/Users/shouichi/ruby/src/identy/DicomFiles/DICOM" )
    assert_equal(
      [ ["USS-V2.5-171117-01 SPL.IMAGE LN^FOR USS44G  FN^MI","USS56-V2.5SP0001-SPL.IMAGE", "20171208","/Users/shouichi/ruby/src/identy/DicomFiles/DICOM/DATA/20171211/194331"],
        ["USS-V2.5-171117-01 SPL.IMAGE LN^FOR USS44G  FN^MI","USS56-V2.5SP0001-SPL.IMAGE", "20171208","/Users/shouichi/ruby/src/identy/DicomFiles/DICOM/DATA/20171211/194331"] ], 
      obr.results )

    obr = Identy.new(["DicomFiles"])
    obr.dcm_dirs( "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058" )
    assert_equal(
      [["DICOMKENSYO_Name",
        "DICOMKENSYO_001",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00002"],
       ["DICOMKENSYO_Name",
        "DICOMKENSYO_002",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00002"],
       ["DICOMKENSYO_Name",
        "DICOMKENSYO_003",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00002"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00001"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00002"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00002"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00002"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00002"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00003"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00003"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00003"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00003"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00005"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00005"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00005"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00005"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00007"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00007"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00007"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00007"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00008"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00008"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00008"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00008"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00009"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00009"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00009"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00012"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00012"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00012"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00012"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00014"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00014"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00014"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00015"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00015"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00015"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00015"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00019"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00019"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00019"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00019"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00022"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00022"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00022"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00023"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00023"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00023"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00023"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00026"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00026"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00026"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00026"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00027"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00027"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00027"],
       ["EM",
        "Z1",
        "20170316",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00027"]
      ],
      obr.results.sort
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

    obr.dcm_dirs( "/Users/shouichi/ruby/src/identy/DicomFiles" )
    assert_equal(
      ["/Users/shouichi/ruby/src/identy/DicomFiles/DICOM",
        "/Users/shouichi/ruby/src/identy/DicomFiles/DICOM/DATA",
        "/Users/shouichi/ruby/src/identy/DicomFiles/DICOM/DATA/20171211",
        "/Users/shouichi/ruby/src/identy/DicomFiles/DICOM/DATA/20171211/194331",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00001",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00001",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00002",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00002",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00003",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00003",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00005",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00005",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00007",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00007",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00008",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00008",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00009",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00009",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00012",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00012",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00014",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00014",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00015",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00015",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00019",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00019",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00022",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00022",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00023",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00023",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00026",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00026",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00027",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180713102058/DICOM/ST00001/SE00027",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180824151159",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180824151159/DICOM",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180824151159/DICOM/ST00001",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180824151159/DICOM/ST00001/SE00001",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180824151159/DICOM/ST00001/SE00002",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180824151159/DICOM/ST00001/SE00003",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180826192330",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180826192330/DICOM",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180826192330/DICOM/ST00001",
        "/Users/shouichi/ruby/src/identy/DicomFiles/Vitrea-20180826192330/DICOM/ST00001/SE00001"],
      obr.dbg_folder_paths.sort
    )
    
  end

  def test_change_string
    obr = Identy.new(["DicomFiles"])
    assert_equal( "DICOM,EM,Z1,20170316", obr.change_string( ["DICOM", "EM", "Z1", "20170316"] ) )
  end

  def test_convert_cvs
    obr = Identy.new(["DicomFiles"])
    assert_equal( ["Patient name,Patient ID,Study Date,DCM File name,DCM path", "DICOM,EM,Z1,20170316", "Foo,bar,ZZ,foofoo", "1,2,3,4"],
      obr.convert_cvs([["DICOM", "EM", "Z1", "20170316"],[nil,0,0,0,0],["Foo","bar","ZZ","foofoo"],["DICOM", "EM", "Z1", "20170316"],["1","2","3","4"]]))
  end

  def test_idx
    obr = Identy.new(["DicomFiles"])
    assert_equal(["foo","bar","fofofo.txt"], obr.idx("foo/bar/fofofo.txt"))
  end

  def test_write_cvs
    obr = Identy.new(["DicomFiles"])
    expected_result = "/Users/shouichi/ruby/src/identy/DicomFiles/dicom_info.txt"
    assert_equal( expected_result, obr.out_file )
    write_contents = ["1,2,3,4","9,9,9,9"]
    assert_equal( write_contents, obr.write_cvs( write_contents ) )
    assert_equal( "1,2,3,4\n9,9,9,9\n", File.open( expected_result ).read )
    File.delete( expected_result )
  end

end
