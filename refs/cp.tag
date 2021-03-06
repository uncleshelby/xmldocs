__NAME__ purpose
copy a file
__END__

__NAME__ synopsis 
<row>

	<entry>
	from
	</entry>
	<entry>
	Yes
	</entry>
	<entry>
	Yes
	</entry>
	<entry>
	<!-- DFL -->
	</entry>
	<entry>
	Source file to copy.
	</entry>

</row> 
<row>

	<entry>
	to
	</entry>
	<entry>
	Yes
	</entry>
	<entry>
	Yes
	</entry>
	<entry>
	<!-- DFL -->
	</entry>
	<entry>
	Destination directory or file to copy to.
	</entry>

</row> 
<row>

	<entry>
	umask
	</entry>
	<entry>
	<!-- POS -->
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	Interchange process default
	</entry>
	<entry>
	File &glos-umask;.
	</entry>

</row> 
<row>

	<entry>
	preserve_times
	</entry>
	<entry>
	<!-- POS -->
	</entry>
	<entry>
	<!-- REQ -->
	</entry>
	<entry>
	0
	</entry>
	<entry>
	Whether to preserve file access and modification times.
	</entry>

</row> 

&TAG_NON_CONTAINER;
__END__


__NAME__ description
The tag simply copies source file to the destination.
__END__

__NAME__ see also
backup-file,backup-database
__END__

__NAME__ example: Basic example
<programlisting>
[either]
  [cp from=pages/index.html to=/tmp/ hide=1]
[or]
  Copy failed. See error logs for details.
[/either]
</programlisting>
__END__

