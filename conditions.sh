function home_space {
	# only the superuser can get this information

	if [ "$(id -u)" = "0" ]; then
		echo "<h2>Home directory space by user</h2>"
		echo "<pre>"
		echo "Bytes Directory"
			du -s ~/* | sort -nr
		echo "</pre"
	fi
}
$(home_space)
