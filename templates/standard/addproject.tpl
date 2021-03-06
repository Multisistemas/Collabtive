<div class="block_in_wrapper">

	<h2>{#addproject#}</h2>

	<form id="addprojectform" novalidate class="main" method="post" action="admin.php?action=addpro">
		<fieldset>

			<div class="row">
				<label for="name">{#name#}:</label>
				<input type="text" class="text" name="name" id="name" required="1" realname="{#name#}" />
			</div>

			<div class="row">
				<label for="desc">{#description#}:</label>
				<div class="editor">
					<textarea name="desc" id="desc" rows="3" cols="1"></textarea>
				</div>
			</div>

		    <div class="clear_both_b"></div>

			<div class="row">
				<label for="end">{#due#}:</label>
				<input type="text" class="text" name="end" id="endP" realname="{#due#}" />
			</div>

			<div class="row">
				<label for="neverdue"></label>
				<input type="checkbox" class="checkbox" value="neverdue" name="neverdue" id="neverdue" onclick="document.getElementById('endP').value='';
				document.getElementById('endP').disabled=!document.getElementById('endP').disabled;">
				<label>{#neverdue#}</label>
			</div>

			<div class="datepick">
				<div id="add_project" class="picker" style="display:none;"></div>
			</div>

			<div class="row">
				<label for="budget">{#budget#}:</label>
				<input type="text" class="text" name="budget" id="budget" value="0" />
			</div>

			<div class = "row">
				<label>{#customer#}:</label>
				<select name="company" id="company" realname="{#assignto#}">
					<option value="-1">{#chooseone#}</option>
					{section name=customer loop=$customers}
						<option value = "{$customers[customer].ID}">{$customers[customer].company}</option>
					{/section}
				</select>
			</div>

			<div class="row">
				<label>{#members#}:</label>
				<div style="float:left;">
			        {section name=user loop=$users}
				        <div class="row">
					        <input type="checkbox" class="checkbox" value="{$users[user].ID}" name="assignto[]" id="{$users[user].ID}" {if $users[user].ID == $userid} checked="checked"{/if} />
					        <label for="{$users[user].ID}">{$users[user].name}</label><br />
				      	</div>
				    {/section}
			    </div>
			</div>


			<input type="hidden" name="assignme" value="1" />

		    <div class="clear_both_b"></div>

			<div class="row-butn-bottom">
				<label>&nbsp;</label>
				<button type="submit" onfocus="this.blur();" onclick="tinyMCE.triggerSave();">{#addbutton#}</button>

				<button type="reset" onclick="blindtoggle('form_{$myprojects[project].ID}');return false;">{#cancel#}</button>

			</div>

		</fieldset>
	</form>
    <script type="text/javascript">
        {literal}
        theCal = new calendar({/literal}{$theM},{$theY}	);
        theCal.dayNames = ["{#monday#}","{#tuesday#}","{#wednesday#}","{#thursday#}","{#friday#}","{#saturday#}","{#sunday#}"];
        theCal.monthNames = ["{#january#}","{#february#}","{#march#}","{#april#}","{#may#}","{#june#}","{#july#}","{#august#}","{#september#}","{#october#}","{#november#}","{#december#}"];
        theCal.relateTo = "endP";
        theCal.dateFormat = "{$settings.dateformat}";
        theCal.getDatepicker("add_project");
    </script>
</div> {*block_in_wrapper end*}
