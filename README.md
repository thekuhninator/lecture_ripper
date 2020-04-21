# lecture_ripper

lecture_ripper is a tool used to extract all audio from a PowerPoint file and place it all in one m4a audio file.

Have your pesky professors ever uploaded a lecture by placing all of the audio files within the PowerPoint? Well that sure is annoying because then you can't watch the lecture on 2x, 3x or even 4x speed! What you need is lecture_ripper.sh! Simply place lecture_ripper.sh in a folder that contains powerpoint files and it will automatically generate audio files for each powerpoint file!

lecture_ripper works by finding all the .pptx files in the directory it is placed in and then runs converts it to a .zip file. It then unzips the zip file to reveal all of the files actually stored within the powerpoint. lecture_ripper then locates all the audio media files, converts them to an audio format which allows them to be concatenated, concatenates them all and outputs one file. It then cleans up the mess it made humbly.

This tool was originally used to rip lectures my professors would put up but it has many more uses besides that!

# FFMPEG IS NEEDED TO SUCCESFULLY RUN LECTURE_RIPPER.
This is because lecture_ripper needs to convert the media files to an audio file format which is easy to concatenate with.
