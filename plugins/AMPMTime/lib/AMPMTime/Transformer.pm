package AMPMTime::Transformer;
use strict;

sub hdlr_template_source_date_picker {
    my ($cb, $app, $tmpl_ref) = @_;
    my $old;
    if ($MT::VERSION =~ /^4/){;
    	    $old = <<'EOF';
            <input class="entry-time" name="t_<mt:var name="field_name">" tabindex="11" value="<$mt:var name="time" escape="html"$>" />
EOF
    }
    else {
    	    $old = <<'EOF';
            <input type="text" class="entry-time" name="t_<mt:var name="field_name" escape="html">" value="<$mt:var name="time" escape="html"$>" />
EOF
}
   
    $old = quotemeta($old);
    $old =~ s!(\\ )+!\\s+!g;

    my $new = <<'EOF';
        <select name="t_<mt:var name="field_name">_hd_time_hour" id="hd_time_hours_<mt:var name="field_name">" onchange="assemble_date_<mt:var name="field_name">();" style="margin-right: 4px;">
        <option style="float: none;" value="1">1</option>
        <option style="float: none;" value="2">2</option>
        <option style="float: none;" value="3">3</option>
        <option style="float: none;" value="4">4</option>
        <option style="float: none;" value="5">5</option>
        <option style="float: none;" value="6">6</option>
        <option style="float: none;" value="7">7</option>
        <option style="float: none;" value="8">8</option>
        <option style="float: none;" value="9">9</option>
        <option style="float: none;" value="10">10</option>
        <option style="float: none;" value="11">11</option>
        <option style="float: none;" value="12">12</option>
    </select>
    <strong>:</strong>
    <select name="t_<mt:var name="field_name">_hd_time_min" id="hd_time_min_<mt:var name="field_name">" onchange="assemble_date_<mt:var name="field_name">();" style="margin: 0 4px;">
        <option style="float: none;" value="00">00</option>

        <option style="float: none;" value="01">01</option>
        <option style="float: none;" value="02">02</option>
        <option style="float: none;" value="03">03</option>
        <option style="float: none;" value="04">04</option>

        <option style="float: none;" value="05">05</option>

        <option style="float: none;" value="06">06</option>
        <option style="float: none;" value="07">07</option>
        <option style="float: none;" value="08">08</option>
        <option style="float: none;" value="09">09</option>

        <option style="float: none;" value="10">10</option>

        <option style="float: none;" value="11">11</option>
        <option style="float: none;" value="12">12</option>
        <option style="float: none;" value="13">13</option>
        <option style="float: none;" value="14">14</option>

        <option style="float: none;" value="15">15</option>

        <option style="float: none;" value="16">16</option>
        <option style="float: none;" value="17">17</option>
        <option style="float: none;" value="18">18</option>
        <option style="float: none;" value="19">19</option>

        <option style="float: none;" value="20">20</option>

        <option style="float: none;" value="21">21</option>
        <option style="float: none;" value="22">22</option>
        <option style="float: none;" value="23">23</option>
        <option style="float: none;" value="24">24</option>

        <option style="float: none;" value="25">25</option>

        <option style="float: none;" value="26">26</option>
        <option style="float: none;" value="27">27</option>
        <option style="float: none;" value="28">28</option>
        <option style="float: none;" value="29">29</option>

        <option style="float: none;" value="30">30</option>

        <option style="float: none;" value="31">31</option>
        <option style="float: none;" value="32">32</option>
        <option style="float: none;" value="33">33</option>
        <option style="float: none;" value="34">34</option>

        <option style="float: none;" value="35">35</option>

        <option style="float: none;" value="36">36</option>
        <option style="float: none;" value="37">37</option>
        <option style="float: none;" value="38">38</option>
        <option style="float: none;" value="39">39</option>

        <option style="float: none;" value="40">40</option>

        <option style="float: none;" value="41">41</option>
        <option style="float: none;" value="42">42</option>
        <option style="float: none;" value="43">43</option>
        <option style="float: none;" value="44">44</option>

        <option style="float: none;" value="45">45</option>

        <option style="float: none;" value="46">46</option>
        <option style="float: none;" value="47">47</option>
        <option style="float: none;" value="48">48</option>
        <option style="float: none;" value="49">49</option>

        <option style="float: none;" value="50">50</option>

        <option style="float: none;" value="51">51</option>
        <option style="float: none;" value="52">52</option>
        <option style="float: none;" value="53">53</option>
        <option style="float: none;" value="54">54</option>

        <option style="float: none;" value="55">55</option>

        <option style="float: none;" value="56">56</option>
        <option style="float: none;" value="57">57</option>
        <option style="float: none;" value="58">58</option>
        <option style="float: none;" value="59">59</option>

    </select>


    <select name="t_<mt:var name="field_name">_hd_time_ampm" id="hd_time_ampm_<mt:var name="field_name">" onchange="assemble_date_<mt:var name="field_name">();" style="margin: 0 4px;">
        <option style="float: none;" value="am">am</option>
        <option style="float: none;" value="pm">pm</option>
    </select>

<input class="entry-time" name="t_<mt:var name="field_name">" style="display: none; visibility: hidden;" value="<$mt:var name="time" escape="html"$>" />


<script type="text/javascript"> 
    function assemble_date_<mt:var name="field_name">() {
       // Calculate hour, based on am/pm
       var hd_hours = document.forms['entry_form'].hd_time_hours_<mt:var name="field_name">.value;
       hd_hours = parseInt(hd_hours);
       if (document.forms['entry_form'].hd_time_ampm_<mt:var name="field_name">.value == 'pm') {
           hd_hours += 12;
           if (hd_hours == 24) { hd_hours = '12'; } //for 12:00 pm
       }
       else { // am; still in the morning.
           if (hd_hours == 12) { hd_hours = '00'; } // for 12:00 am
           hd_hours += '';
           if (hd_hours.length != 2) { hd_hours = '0' + hd_hours; }
       }

       // Update the "real" date-time stamp field
       document.forms['entry_form'].t_<mt:var name="field_name">.value = hd_hours + ':' + document.forms['entry_form'].hd_time_min_<mt:var name="field_name">.value + ':' + '00';
    }

    function hd_grab_<mt:var name="field_name">() { 
        // Get the time from the authored_on_time field. Important, in case
        // the entry was already saved, we need the right time.
        var hd_now = document.forms['entry_form'].t_<mt:var name="field_name">.value;
        var hd_hours = hd_now.substring(0, 2);
        hd_hours = parseInt(hd_hours, 10);
        if ( (hd_now.substring(3, 5) == 57) || (hd_now.substring(3, 5) == 58) || (hd_now.substring(3, 5) == 59) ) {
            hd_hours++; // if it's near the end of the hour, round up to the next hour
        }
        if (hd_hours >= 12) { //pm
            hd_hours -= 12;
            document.forms['entry_form'].hd_time_ampm_<mt:var name="field_name">.value = 'pm';
            if (hd_hours == 0) { hd_hours = '12'; } // for 12:00 pm
            hd_hours = hd_hours + '';
            document.forms['entry_form'].hd_time_hours_<mt:var name="field_name">.value = hd_hours;
        }
        else { // am
            if (hd_hours == 0) { // for 12:00 am
                hd_hours = '12';
            }
            document.forms['entry_form'].hd_time_ampm_<mt:var name="field_name">.value = 'am';
            document.forms['entry_form'].hd_time_hours_<mt:var name="field_name">.value = hd_hours;
        }

        document.forms['entry_form'].hd_time_min_<mt:var name="field_name">.value = hd_now.substring(3, 5);
    }

    hd_grab_<mt:var name="field_name">();
</script>   
EOF

    $$tmpl_ref =~ s!$old!$new!;
}



1;
