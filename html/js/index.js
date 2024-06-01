var input_type
var type
window.addEventListener('message', function(event) {
    var item = event.data;
    var status = item.status;
    type = item.type;
    var lang = item.lang;
   

    if (type == 'Input') {
        ShowInput(status);
        function ShowInput(bool) {
            if (bool) {
                input_type = item.input_type;
                var data = item.data;
                if(input_type == "number") {
                    $('#inputfield').show();
                    $('#selectfield').hide();
                    document.getElementById("inputfield-div").innerHTML = '<input id="inputfield" style="height: 20px; width: 90%; outline: none;" type="number" placeholder="'+data+'">';
                }
                else if(input_type == "password") {
                    $('#inputfield').show();
                    $('#selectfield').hide();
                    document.getElementById("inputfield-div").innerHTML = '<input id="inputfield" style="height: 20px; width: 90%; outline: none;" type="password" placeholder="'+data+'">';
                }
                else if(input_type == "text") {
                    $('#inputfield').show();
                    $('#selectfield').hide();
                    document.getElementById("inputfield-div").innerHTML = '<input id="inputfield" style="height: 20px; width: 90%; outline: none;" type="text" placeholder="'+data+'">';
                }
                else if(input_type == "color") {
                    $('#inputfield').show();
                    $('#selectfield').hide();
                    document.getElementById("inputfield-div").innerHTML = '<input id="inputfield" style="height: 20px; width: 90%; outline: none;" type="color" placeholder="'+data+'">';
                }
                else if(input_type == "month") {
                    $('#inputfield').show();
                    $('#selectfield').hide();
                    document.getElementById("inputfield-div").innerHTML = '<input id="inputfield" style="height: 20px; width: 90%; outline: none;" type="month" placeholder="'+data+'">';
                }
                else if(input_type == "date") {
                    $('#inputfield').show();
                    $('#selectfield').hide();
                    document.getElementById("inputfield-div").innerHTML = '<input id="inputfield" style="height: 20px; width: 90%; outline: none;" type="date" placeholder="'+data+'">';
                }
                else if(input_type == "datetime") {
                    $('#inputfield').show();
                    $('#selectfield').hide();
                    document.getElementById("inputfield-div").innerHTML = '<input id="inputfield" style="height: 20px; width: 90%; outline: none;" type="datetime-local" placeholder="'+data+'">';
                }
                else if(input_type == "range") {
                    $('#inputfield').show();
                    $('#selectfield').hide();
                    document.getElementById("inputfield-div").innerHTML = '<input id="inputfield" style="height: 20px; width: 90%; outline: none;" type="range" placeholder="'+data+'">';
                }
                else if(input_type == "time") {
                    $('#inputfield').show();
                    $('#selectfield').hide();
                    document.getElementById("inputfield-div").innerHTML = '<input id="inputfield" style="height: 20px; width: 90%; outline: none;" type="url" placeholder="'+data+'">';
                }
                else if(input_type == "week") {
                    $('#inputfield').show();
                    $('#selectfield').hide();
                    document.getElementById("inputfield-div").innerHTML = '<input id="inputfield" style="height: 20px; width: 90%; outline: none;" type="week" placeholder="'+data+'">';
                }
                else if (input_type == "select") {
                    $('#inputfield').hide();
                    $('#selectfield').show();
                    var selectfield = document.getElementById("selectfield");
                    for (let i = 0; i < data.length; i++) {
                        var element = data[i];
                        selectfield.innerHTML += `<option value="`+ element.value +`">`+ element.label +`</option>`
                    }
                }
                
    
                document.getElementById("cancel").innerHTML = translation[lang].cancel;
                
                document.getElementById("top").innerHTML = '<p style="color: #fff; font-size: 25px; font-family: '+"SignPrinterHouseScript"+', sans-serif; margin: 0; max-width: 100%;">'+ item.text +'</p>';
                $('#input-body').show();
            } else {
                $('#inputfield').hide();
                $('#selectfield').hide();
                $('#input-body').hide();
            }
        } 
    } else if (type == 'Progressbar') {
        if (status === true) {
            var time = item.time;
            var text = item.text;
            
            $("#mina").show();
            
            $('#pbar_innertext').text(text);
            
            console.log(time)
            $('#pbar_innerdiv').stop().css({ width: '0px' }).animate({
                width: '100%',
            }, time, 'linear',
                function () {
                    $("#mina").hide();
                    $("#pbar_innerdiv").css({"width":"0px"});
                }
            );

        } else {
            $("#mina").hide();
        }
    }

    else if(type == "Notify") {
        var iconArray = item.icon;
        var icon = iconArray.icon;
        var title = item.title;
        var msg = item.msg;
        var time = item.time;
        var gradient = iconArray.gradient;
        var gradient1 = gradient.color1;
        var gradient2 = gradient.color2;

        var uniqueId = Date.now(); 

        this.document.getElementById("notify").innerHTML += 
        `<div id="messageContainer${uniqueId}" style="opacity: 0; transition: opacity 1s; padding: 5px; border-radius: 15px; width: 250px; background:linear-gradient(90deg, ${gradient1}, ${gradient2}); margin-right: 20px; margin-top: 10px; box-shadow: 7px 5px 5px rgba(0, 0, 0, 0.28); display: flex; transition: 200ms;" class="message">
            <div style="width: 17%; height: 100%; display: flex; justify-content: center; align-items: center;" class="left">
                <i style="color: #fff;" class="fas ${icon}"></i>
            </div>
            <div style="width:83%; display: flex; flex-direction: column; justify-content: center;" class="right">
                <div style="height: 40%; display: flex; align-items: center; margin-top: 9px;" class="top">
                    <p style="color: #fff; font-size: 15px; margin-top: 0; margin-bottom: 3px;">${title}</p>
                </div>
                <div id="bottomContent${uniqueId}" style="height: auto; display: flex; align-items: flex-start; margin-top: 0px; margin-bottom: 10px;" class="bottom">
                    <p style="color: #fff; margin: 0; max-width: 185.81px;">${msg}</p>
                </div>
            </div>       
        </div>`;

        var containerToFadeIn = this.document.getElementById(`messageContainer${uniqueId}`);
        setTimeout(() => {
            if (containerToFadeIn) containerToFadeIn.style.opacity = 1;
        }, 10);

        setTimeout(() => {
            var containerToFadeOut = this.document.getElementById(`messageContainer${uniqueId}`);
            if (containerToFadeOut) containerToFadeOut.style.opacity = 0;

            setTimeout(() => {
                var containerToRemove = this.document.getElementById(`messageContainer${uniqueId}`);
                if (containerToRemove) containerToRemove.remove();
            }, 1000);
        }, time);

        // Nachrichtenhöhe anpassen
        setTimeout(() => {
            adjustMessageHeight(`bottomContent${uniqueId}`);
        }, 100);

        // Funktion zur Anpassung der Nachrichtenhöhe
        function adjustMessageHeight(bottomContentId) {
            var bottomContent = document.getElementById(bottomContentId);
            var messageContainer = bottomContent.closest('.message');
            var bottomContentHeight = bottomContent.offsetHeight;
            messageContainer.style.height = (50 + bottomContentHeight) + 'px';
        }
    }
});

var translation;

window.addEventListener("keydown", function (event) {
    if (event.defaultPrevented) {
    return;
    }
        switch (event.key) {
        case "Escape":
            $.post('https://Lux_Lib/input_exit', JSON.stringify({}), function(response) {});
            if (input_type == "color") {
                document.getElementById("inputfield").value = '#000000';
            } else if (input_type == "select") {
                document.getElementById("selectfield").innerHTML = ''
            }
            else{
                document.getElementById("inputfield").value = "";
            }
        break;
        default:
        return;
    }
    event.preventDefault();
}, true);


import_translation();
async function import_translation() {
    const response = await fetch("./json/translation.json");
    translation = await response.json();
}

function input_send() {
    var input
    if (input_type == "select") {
        input = document.getElementById("selectfield").value;
    } 
    else {
        input = document.getElementById("inputfield").value;
    }
    $.post('https://Lux_Lib/input_send', JSON.stringify({input: input}), function(response) {});
    if (input_type == "color") {
        document.getElementById("inputfield").value = '#000000';
    } else if (input_type == "select") {
        document.getElementById("selectfield").innerHTML = ''
    }
    else {
        document.getElementById("inputfield").value = "";
    }
}

function input_close_ui() {
    $.post('https://Lux_Lib/input_exit', JSON.stringify({}), function(response) {});
    if (input_type == "color") {
        document.getElementById("inputfield").value = '#000000';
    } else if (input_type == "select") {
        document.getElementById("selectfield").innerHTML = ''
    }
    else {
        document.getElementById("inputfield").value = "";
    }
}


//notify 

