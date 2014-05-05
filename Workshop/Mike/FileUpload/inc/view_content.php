<h1>View Files</h1>
<p>Below is a listing off all your uploaded files. To download one of the files, please right-click the filename and select "Save Link As..." or the equivalent for your browser of choice.</p>

<table>
	<tr>
		<th class="j"></th>
		<th class="d">Filename</th>
		<th class="q">Size</th>
		<th class="o"></th>
	</tr>

<?php 
	$upload = "uploads/";
	$dirs = scandir($upload);
	foreach ($dirs as $dir) {
		if (substr($dir, 0, 1) != '.' && filetype($upload.$dir) == 'dir') {
			echo '<tr class="rowDirectory"><td colspan="4">' .$dir. '</td></tr>';
			$dir = $upload . $dir;
			if (filetype($dir) == 'dir') {
				$files = scandir($dir);
				foreach ($files as $file) {
					if (substr($file, 0, 1) != '.') {
						$fullpath = $dir."/".$file;
?>						
						<tr class="g">
							<td class="j"></td>
							<td class="d"><a href="<?php echo $fullpath; ?>"><?php echo $file; ?></a></td>
							<td class="q"><?php printf("%dKB", max(1, round(filesize($fullpath)/1024)) );  ?></td>
							<td class="o"><a <?php echo "href='delete.php?filepath=".$fullpath."'" ?> onclick="return confirm('Are you sure you want to delete this file?');"><img src="images/delete.jpg" width="20px" height="20px" alt="Delete File" /></td>
						</tr>
							
<?php						
					}					
				}

			}
		}
	}

 ?>

 </table>
