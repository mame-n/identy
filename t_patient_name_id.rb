require "test/unit"
require "./patient_name_id.rb"

class TC < Test::Unit::TestCase
  def setup
  end

  def test_name_id_01
    o = PatientNameID.new("./DicomFiles/Vitrea-20180713102058/DICOMDIR")
    assert_equal( {:fname=>"DICOMDIR",:pid=>nil,:pname=>nil,:study_date=>nil}, o.name_id )
  end

  def test_name_id_02
    o = PatientNameID.new("/Users/shouichi/ruby/src/identy/DicomFiles/US000001")
    assert_equal( {:fname=>"US000001", :pid=>"CC", :pname=>"CC", :study_date=>"20060714"}, o.name_id )
  end

  def test_name_id_03
    o = PatientNameID.new("./identy.rb")
    assert_equal( {:fname=>"identy.rb", :pid=>nil, :pname=>nil, :study_date=>nil}, o.name_id )
  end

  def test_name_id_04
    o = PatientNameID.new("./DicomFiles/TestFile")
    assert_equal( {:fname=>"TestFile", :pid=>nil, :pname=>nil, :study_date=>nil}, o.name_id )
  end
end
