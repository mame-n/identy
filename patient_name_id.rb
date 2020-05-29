class PatientNameID
  def initialize( file_path = "DicomFiles/US000001" )
    @file_path = file_path
  end

  def name_id
    file_name = @file_path.split("/")[-1]
    result_name_id = {:fname=>file_name, :pname => nil, :pid => nil, :study_date => nil}
    
    return result_name_id if file_name == "DICOMDIR"

    open( @file_path, "rb" ) do |fp|
      break if (dicom_prefix = fp.read(128+4)) == nil
      puts "Patient_name_id: 14 - @file_path : #{@file_path}, dcimo_prefic.size : #{dicom_prefix.size}"
      break if dicom_prefix.size < 128+4
      break if dicom_prefix.unpack("@128a4") != ["DICM"]

      allget = 3
      while allget > 0 && (data = fp.read(6)) != nil # Tag1, Tag2, VR, size
        header = data.unpack("S2A2")
#        printf "allget %d, header [%04x, %04x, \"%s\"] ", allget, header[0], header[1], header[2]
        body_size = body_size( fp, header )
        if body_size == -1
#          puts "Break"
          break
        end
        body = fp.read( body_size )
#        printf " body %s\n", body
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
    if ["OB","OF","OW","UN","UT"].include?( header[2] )
      fp.read(2)
      fp.read(4).unpack("L")[0]
    elsif ["AE","AS","AT","CS","DA","DS","DT","FL","FD","IS","LO","LT","OD","OL","OV","PN","SH","SL","SS","ST","SV","TM","UC","UI","UL","UR","US","UV"].include?( header[2] )
      fp.read(2).unpack("S")[0]
    elsif ["SQ"].include?( header[2] )
      fp.read(2)
      size = fp.read(4)
      if size.unpack("S2") != [0xFFFF,0xFFFF]
        size.unpack("L")[0]
      else
        dum_read_SQ( fp )
      end
    else
      -1
    end
  end

  def dum_read_SQ( fp )
    begin
      val = fp.read(2)
#      printf "** 0x%04X ", val.unpack("S")[0]
      next if val.unpack("S") != [0xFFFE]
      val2 = fp.read(2)
#      printf "0x%04X\n", val2.unpack("S")[0]
    end while val2.unpack("S") != [0xE0DD]
    fp.read(4)
    0
  end

  def idx(d_dir)
    d_dir.split("/")[0]
  end

end
