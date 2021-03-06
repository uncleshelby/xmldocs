__NAME__ purpose
encrypt a string exactly like the crypt(3) function in the C library
__END__


__NAME__ synopsis
<row>
	<entry>
		<group choice='plain'>
		<arg choice='plain'>value</arg>
		<arg choice='plain'>password</arg>
		</group>
	</entry>
	<entry>Yes</entry><entry>Yes</entry>
	<entry></entry>
	<entry>Text to encrypt.</entry>
</row>
<row>
	<entry>
		<group choice='plain'>
		<arg choice='plain'>salt</arg>
		<arg choice='plain'>crypted</arg>
		</group>
	</entry>
	<entry>Yes</entry><entry></entry>
	<entry>Random 2-character string</entry>
	<entry>Crypt salt. You usually
	want to leave it empty for the tag to generate the random salt itself.
	Specifying salt only makes sense for testing purposes, or when you're
	verifying the password, like you see in <xref linkend='crypt_examples'/>.
	</entry>
</row>
&TAG_NON_CONTAINER;
__END__


__NAME__ description
Encrypts a string exactly like the <function>crypt(3)</function>
function in the C library.
</para><para>
Note that crypt is intended to be a one-way function, much like breaking eggs to make an omelette. There is no (known) corresponding decrypt function. As a result, this function isn't all that useful for any cryptography.
</para><para>
This tag simply calls the Perl built-in <function>crypt()</function> function.
</para><para>
When verifying an existing encrypted string you should use the encrypted text as the salt (like <code>[crypt PLAIN CRYPTED]</code>) and compare that to CRYPTED (it should be equal). This allows your code to work with the standard crypt and with more exotic implementations.
</para><para>
When choosing a new salt, either let the tag generate a 2-character random string itself, or generate one yourself from the [./0-9A-Za-z] set. (working Perl code would be <code>join '', ('.', '/', 0..9, 'A'..'Z', 'a'..'z')[rand 64, rand 64]</code>.
</para><para>
The crypt function is unsuitable for encrypting large quantities of data, not least of all because you can't get the information back.
__END__


__NAME__ online: Crypt a string and verify it
Note that this example is of little use in practice, but does show the
components you can re-use:
<programlisting><![CDATA[
<p>
[seti salt][perl]join '', ('.', '/', 0..9, 'A'..'Z', 'a'..'z')[rand 64, rand 64][/perl][/seti]
String "test" crypted with salt "[scratch salt]": [crypt value="test" salt="[scratch salt]"]
</p>

<p>
[seti crypted][crypt value="test" salt="[scratch salt]"][/seti]
Checking validity: [crypt value="test" salt="[scratch crypted]"]
</p>

<p>
[perl]
$Tag->crypt("test", $Scratch->{crypted}) eq $Scratch->{crypted} ?
  "Password matches." : "Password does not match."
[/perl]
</p>
]]></programlisting>
__END__

