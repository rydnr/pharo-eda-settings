Extension { #name : #SettingTreeBuilder }

{ #category : #'*EDAS-Settings' }
SettingTreeBuilder >> pharoedasettings [

	"Process a <systemsettings> pragma"

	<settingPragmaProcessor>
	currentPragma methodClass instanceSide
		perform: currentPragma methodSelector
		with: self
]
