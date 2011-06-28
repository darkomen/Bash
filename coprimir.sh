for i in *.srt;do tar rf subs.tar $i|gzip -c subs.tar> subs.tar.gz;done
