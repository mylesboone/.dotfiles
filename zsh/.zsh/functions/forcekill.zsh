forcekill () {
        ps -e | grep $1 | ruby -e "ARGF.read.to_s.split(/\\n/).each { |l| puts l.split(' ').first }" | xargs -L 1 kill -9
}
