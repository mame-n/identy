class PatientNameID
  def initialize( file_path = "DicomFiles/US000001" )
    @file_path = file_path
  end

  def name_id
    file_name = @file_path.split("/")[-1]
    result_name_id = {:fname=>file_name, :pname => nil, :pid => nil, :study_date => nil}
    
    return result_name_id if file_name == "DICOMDIR"

    open( @file_path, "rb" ) do |fp|
      dicom_prefix = fp.read(128+4)
      break if dicom_prefix.size < 128+4
      break if dicom_prefix.unpack("@128a4") != ["DICM"]

      allget = 3
      while allget > 0 && (data = fp.read(6)) != nil # Tag1, Tag2, VR, size
        header = data.unpack("S2A2")
        break if body_size( fp, header ) == 0

#        begin
          body = fp.read( body_size( fp, header ) )
#        rescue
#          break
#        end

#        puts "header #{header} body #{body}"
        if header[0] == 0x0010 && header[1] == 0x0010 # Patient name
          allget -= 1
          result_name_id[:pname] = body.unpack("A*")[0]
        elsif header[0] == 0x0010 && header[1] == 0x0020  # Patirnt ID
          allget -= 1
          result_name_id[:pid] = body.unpack("A*")[0]
        elsif header[0] == 0x0008 && header[1] == 0x0020  # Study date
          allget -= 1
          result_name_id[:study_date] = body.unpack("A*")[0]
        else
          #
        end
      end
    end

    result_name_id
  end

  def body_size( fp, header )
    if ["OB","OR","SQ","OW","UN"].include?( header[2] )
      fp.read(2)
      fp.read(4).unpack("L")[0]
    elsif [].icnlude?( header[2] )
      fp.read(2).unpack("S")[0]
    else
      0
    end
  end

  def idx(d_dir)
    d_dir.split("/")[0]
  end

end
