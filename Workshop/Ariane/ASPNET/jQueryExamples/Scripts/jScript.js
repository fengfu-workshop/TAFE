$(document).ready(function () {
    //$('tr:even').addClass('even_row');
    $('tr:even').addClass('even_row');

    $("#Button2").click(function () {
        //alert("Warning message");  
        $('tr:even').hasClass('even_row') ? $('tr:even').removeClass('even_row') : $('tr:even').addClass('even_row');
        $('#Button1').toggle();
 
        alert($('tr:first').css('font-size'));
    });
    $('#btnAdd').click(function () {
        $('<p>A new paragraph!</p>').insertAfter('p');
    });
    $('#btnRemove').click(function () {
        $('#second').remove();;
    });
    $('#btnModify').click(function () {
        //$('#third').html('modified <strong>text</strong>');
        $('#third').text('modified <strong>text</strong>');
    });
    $('#btnShowBird').click(function () {
        $('#birdImage').fadeIn();
    });
    $('#btnHideBird').click(function () {
        $('#birdImage').fadeOut();
    });
    $('#btnSlide').click(function () {
        $('#birdImage').slideToggle('slow', function () {
            alert('The slide has finished sliding!')
        });
    });
    $('#blCategoriesHover li').hover(function () {
        $(this).addClass('even_row');
    }, function () {
        $(this).removeClass('even_row');
    });
    $('#gvProducts tr:odd').addClass('alternate');
    $('#gvProducts th').hover(function () {
        var index = ($(this).parent().children().index(this)) + 1;
        $(this).toggleClass('hoverHeading');
        $('#gvProducts td:nth-child(' + index + ')').toggleClass('hoverColumn');
    });
    $('.categories li').hover(function () {
        $(this).toggleClass('hoverContent');
    });
    $('input[value="Display Confirmation"]').click(function () {
        return window.confirm("Are you sure?");
    });
    //$('input[name$="btnHighlight"]').hover(function () {
    //    $('span[id*="lblCategoryName"]').addClass('standOut');
    //}, function () {
    //    $('span[id*="lblCategoryName"]').removeClass('standOut')
    //});
    $('input[name$="btnHighlight"]').hover(function () {
        $('span[id*="lblCategoryName"]').toggleClass('standOut');
    });
});