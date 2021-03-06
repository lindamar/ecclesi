(function($){
    $(function(){

        $('#action_noticia').click(function(event) {
            event.preventDefault();
            $.ajax({
                url: "http://ecclesiapp.vicariadepastoralmanagua.org/"+$('#id_templo_noticia').val()+"/guardar_noticia/"+$('#titulo').val()+"/"+$('#noticia').val(),
                type: "GET",
            })
            .always( function() {
                $('#noticia_form').submit();
            });
        });

        $('#action_actividad').click(function(event) {
            event.preventDefault();
            $.ajax({
                url: "http://ecclesiapp.vicariadepastoralmanagua.org/"+$('#id_templo_actividad').val()+"/guardar_actividad/"+$('#nombre_actividad').val()+"/"+$('#dia').val()+"/"+$('#hora').val()+"/"+$('#descripcion').val()+"/"+$('#id_tipo_actividad').val(),
                type: "GET",
            })
            .always( function() {
                $('#actividad_form').submit();
            });
        });

        $('#action_templo').click(function(event) {
            //alert($('#id_templo').val()+"/actualizar_templo/"+$('#nombre').val()+"/"+$('#nombre_popular').val()+"/"+$('#direccion').val()+"/"+$('#telefono').val()+"/"+$('#historia').val()+"/"+$('#institucion').val()+"/"+$('#portada').val()+"/"+$('#id_zona_parroquial').val()+"/"+$('#municipio').val()+"/"+$('#categoria').val()+"/"+$('#galeria').val()+"/"+$('#servicio_religioso').val());
            event.preventDefault();
            $.ajax({
                url: "http://ecclesiapp.vicariadepastoralmanagua.org/"+$('#id_templo').val()+"/actualizar_templo/"+$('#nombre').val()+"/"+$('#nombre_popular').val()+"/"+$('#direccion').val()+"/"+$('#telefono').val()+"/"+$('#historia').val()+"/"+$('#institucion').val()+"/"+$('#portada').val()+"/"+$('#id_zona_parroquial').val()+"/"+$('#municipio').val()+"/"+$('#categoria').val()+"/"+$('#galeria').val()+"/"+$('#servicio_religioso').val(),
                type: "GET",
            })
            .always( function() {
                $('#templo_form').submit();
            });
        });

        // Plugin initialization
        $('.carousel.carousel-slider').carousel({full_width: true});
        $('.carousel').carousel();
        //$('.slider').slider({full_width: true});
        $('.parallax').parallax();
        $('.modal').modal();
        //$('.modal-trigger').leanModal();
        $('.scrollspy').scrollSpy();
        $('.button-collapse').sideNav();
        $('.datepicker').pickadate({selectYears: 100});
        //$('select').not('.disabled').material_select();
        $('select').material_select();
        $('.dropdown-button').dropdown();

        $(window).scroll(function() {
            var altura_cabecera = $('.parallax-container').outerHeight(true);
            var altura_menu = $('.menu').outerHeight(true);

            if ($(window).scrollTop() >= altura_cabecera){
                $('#cabecera').addClass('hide');
                $('.menu').addClass('navbar-fixed');
                $('#contenido').css('margin-top', '600px');
                //$('#inicio a').replaceWith( '<a href="{{ url_for(' + 'curia.inicio' + ') }}" style="padding: 0 0 0 60px;"><img class="responsive-img" src="{{ url_for(' + 'static' + ', filename=' + 'img/escudo_curia.svg' + ') }}" style="width: 64px;height: 64px;"></a>' );
            } else {
                $('#cabecera').removeClass('hide');
                $('.menu').removeClass('navbar-fixed');
                $('#contenido').css('margin-top', '0');
                //$('#inicio a').replaceWith( '<a href="{{ url_for(' + 'curia.inicio' + ') }}">Inicio</a>' );
            }
        });

        var window_width = $(window).width();
        var window_height = $(window).height();

        var roller_alto = $('#roller ul').height();
        $('#roller ul').css('top', ((window_height / 2) - roller_alto) + 'px');
        $('.block').css('height', window_height + 'px');

        var pie_alto = $('.pie-seccion').height();
        $('.carousel.carousel-slider').css('height', '450px');

        // Seccion 1
        var contenido1_alto = $('#seccion1 .contenido').height();
        contenido1_alto = (window_height / 2) - (contenido1_alto / 1.5);
        $('#seccion1 .contenido').css('margin-top', contenido1_alto + 'px');
        $('#seccion1 .pie-seccion').css('margin-top', (window_height - pie_alto) + 'px');
        // Seccion 2
        $('.carousel.carousel-slider').css('height', '450px');
        var contenido2_alto = $('#seccion2 .contenido').height();
        contenido2_alto = (window_height / 2.2) - (contenido2_alto / 2);
        $('#seccion2 .contenido').css('margin-top', contenido2_alto + 'px');
        $('#seccion2 .pie-seccion').css('margin-top', ((window_height / 6.4) - pie_alto) + 'px');
        // Seccion 3
        var contenido3_alto = $('#seccion3 .contenido').height();
        contenido3_alto = (window_height / 2) - (contenido3_alto / 1.8);
        $('#seccion3 .contenido').css('margin-top', contenido3_alto + 'px');
        $('#seccion3 .pie-seccion').css('margin-top', ((window_height / 6.2) - pie_alto) + 'px');

        $('.tabs .tab').click(function(){
            $('.tab').each(function(index, element){
                $(element).removeClass('tabtive');
            });
           $(this).addClass('tabtive');
        });

        var alto = 0;

        $('#tabs').children().each(function(index, element) {
            $(element).css('top', alto);
            alto += $(element).height();
        });
        $('#tabs').height(alto);

        /*var x = $('.no_edit').prev().width();
        var y = $('.no_edit').prev().height();
        $('.no_edit').css('margin-left', (x + 30) + 'px');
        $('.no_edit').css('margin-top', y + 'px');*/

        $('.switch').change(function() {
            if($('.contrasehna_switch').is(':checked')) $('.contrasehna').attr('type', 'text');
            else $('.contrasehna').attr('type', 'password');
        });

        $('#nuevo_usuario_tipo').change(function() {
            $('#nuevo_usuario_tipo option:selected').each(function() {
                if( $(this).val() == 2) {
                    $('#form_presb').removeClass('hide');
                    $('#contra_user').addClass('hide');
                }
                else {
                    $('#form_presb').addClass('hide');
                    $('#contra_user').removeClass('hide');
                }
            });
        });

    }); // end of document ready
})(jQuery); // end of jQuery name space
