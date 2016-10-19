Ohai.plugin(:Apache) do
	provides "apache/modules"

	collect_data(:default) do
		apache Mash.new
		apache[:modules] = shell_out("apachectl -t -D DUMP_MODULES").stdout
	end
end