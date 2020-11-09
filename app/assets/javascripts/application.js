// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require_tree .

$(document).ready(() => {
    var region = "", city = 0, institution_type = 0, eduForm = 0

    $(document).ajaxSend(function(event, request, settings) {
        $('#ajax_loader').show();
    });

    $(document).ajaxComplete(function(event, request, settings) {
        $('#ajax_loader').hide();
    });

    $("#regionSelect").change((event) => {
        region = event.target.value;
        $.ajax({
            type: "GET",
            url: "/get_cities_by_region?region=" + region,
            success: (response) => {
                $("#citySelect").html('')
                $("#citySelect").append("<option selected disabled>Город/поселок/село</option>");
                $("#institutionTypeSelect").prop('selectedIndex', 0);

                if (response.length <= 0) {
                    $("#citySelect").html('')
                    $("#citySelect").append("<option selected disabled>Нет городов/населенных пунктов, укажите его в вопросе</option>");
                    return
                }
                response.forEach((city) => {
                    var $option = $("<option/>", {
                        value: city.id,
                        text: city.name
                    });
    
                    $("#citySelect").append($option);
                });
            }
        });
    });
    
    $("#citySelect").change((event) => {
        city = event.target.value;
    });
    
    $("#citySelect").change((event) => {
        var city_selected = $('#regionSelect option:selected');
        if (!city_selected) {
            alert("Выберите город/населенный пункт!")
        }
    });

    $("#institutionTypeSelect").change((event) => {
        institution_type = event.target.value;
        $.ajax({
            type: "GET",
            url: "/get_institutions?city=" + city + "&institution_type=" + institution_type,
            success: (response) => {
                $("#institutionSelect").html('')
                $("#subjectSelect").html('')
                $("#institutionSelect").append("<option selected disabled>Учебное заведение</option>");
                $("#subjectSelect").append("<option selected disabled>Профильные предметы</option>");
                
                if (response.institutions.length <= 0) {
                    $("#institutionSelect").html('')
                    $("#institutionSelect").append("<option selected disabled>Не найдено учебное заведение, укажите его в вопросе</option>");
                }
                if (response.subjects.length <= 0) {
                    $("#subjectSelect").html('')
                    $("#subjectSelect").append("<option selected disabled>Не найдены профильные предметы, укажите их в вопросе</option>");
                    return
                }
                
                response.institutions.forEach((institution) => {
                    var $option = $("<option/>", {
                        value: institution.id,
                        text: institution.name
                    });

                    $("#institutionSelect").append($option);
                });

                response.subjects.forEach((subject) => {
                    var $option = $("<option/>", {
                        value: subject.id,
                        text: subject.name
                    });
    
                    $("#subjectSelect").append($option);
                });
            }
        });
    });

    $("#educationFormSelect").change((event) => {
        eduForm = event.target.value;
        $.ajax({
            type: "GET",
            url: "/get_education_programs?education_form=" + eduForm,
            success: (response) => {
                $("#educationProgramSelect").html('')
                $("#educationProgramSelect").append("<option selected disabled>Образовательная программа</option>");
                if (response.length <= 0) {
                    $("#educationProgramSelect").html('')
                    $("#educationProgramSelect").append("<option selected disabled>Не найдена образовательная программа, укажите ее в вопросе</option>");
                    return
                }
                
                response.forEach((eduProgram) => {
                    
                    var $option = $("<option/>", {
                        value: eduProgram.id,
                        text: eduProgram.name
                    });
    
                    $("#educationProgramSelect").append($option);
                });
            }
        });
    });

    $("#subjectSelect").change((event) => {

    });

    $("#languageSelect").change((event) => {

    });

    $("#educationProgramSelect").change((event) => {

    });

    $("#departmentSelect").change((event) => {

    });

    $("#refresh").click(() => {
        $("img.rucaptcha-image").attr("src", '/rucaptcha/?locale=ru?t=' + Date.now());
    });
});