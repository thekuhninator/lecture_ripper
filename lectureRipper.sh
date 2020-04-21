echo "Concatenating all files"


for lecture_file in *.pptx

	do
		lecture_name="${lecture_file%.*}"
		lecture_aac="{$lecture_name}.aac"
		touch "$lecture_aac"
		#zip "$lecture_file"
		echo "$lecture_name"
		echo "$lecture_file"
		zip_file="${lecture_file}.zip"
		cp "$lecture_file" "$zip_file"
		archive_dir="${lecture_name}_archive"
		mkdir "$archive_dir"
		unzip -d "$archive_dir" "${lecture_file}.zip"


		# now let's get all the media files
		media_dir="$archive_dir"/ppt/media
		for media_file in "$media_dir"/media*
			do
				# here we will assume 
				echo "$media_file"
				#length=${#media_file}
				# if the length is 10, then it is below 10
				# we must change this to have a zero in front of it
				media_file_name="${media_file##*/}"
				echo "media file name " "$media_file_name"
				echo "length of file " ${#media_file_name}
				if [ ${#media_file_name} -eq 10 ]; then
					echo "inside_if_statemetn"
					first=${media_file_name:0:5}
					second=0
					last=${media_file_name:5:5}
					echo "$first""$second""$last"
					new_media_name="$first""$second""$last"
				else
					echo "else_statement"
					echo "length is fine"
					new_media_name="$media_file_name"

				fi
				
				new_media_basename="${new_media_name%.*}"
				../ffmpeg/bin/ffmpeg.exe -i "$media_file" -acodec copy "${new_media_name}.aac"

				

			done

	cat *.aac > "$lecture_aac"
	rm media*
	../ffmpeg/bin/ffmpeg.exe -i "$lecture_aac" -acodec copy -bsf:a aac_adtstoasc "${lecture_name}.m4a"
	rm "$lecture_aac"
	done

#for fileName in media*
#	do 
#		
#	done

#cat *.aac > newLectureTest





