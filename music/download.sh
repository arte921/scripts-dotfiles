youtube-dl --prefer-ffmpeg --restrict-filenames -i --output "$2/%(title)s.%(ext)s" --extract-audio --audio-format wav $1
