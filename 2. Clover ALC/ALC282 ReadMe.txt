Use in Clover Inject AudioID: 1
Or Patch your DSDT to LayoutID: 1


Add this to Clover Kext Patches:

                       <dict>
				<key>Comment</key>
				<string>AppleHDA ALC282 p1</string>
				<key>Find</key>
				<data>
				hBnUEQ==
				</data>
				<key>Name</key>
				<string>AppleHDA</string>
				<key>Replace</key>
				<data>
				ggLsEA==
				</data>
			</dict>
			<dict>
				<key>Comment</key>
				<string>AppleHDA ALC282 p2</string>
				<key>Find</key>
				<data>
				hAjsEA==
				</data>
				<key>Name</key>
				<string>AppleHDA</string>
				<key>Replace</key>
				<data>
				AAAAAA==
				</data>
			</dict>