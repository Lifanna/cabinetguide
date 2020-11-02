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

    $("#institutionTypeSelect").change((event) => {
        institution_type = event.target.value;
        $.ajax({
            type: "GET",
            url: "/get_institutions?city=" + city + "&institution_type=" + institution_type,
            success: (response) => {
                $("#institutionSelect").html('')
                $("#subjectSelect").html('')

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