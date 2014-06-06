$(function() {
    $('.like').click(function(e) {
        e.preventDefault();
        var personId = $(this).parent().find("[name='personId']").val();
        var postId = $(this).parent().find("[name='postId']").val();
        var $totalLikes = $(this).parent().find(".total-likes");
        $.ajax({
            url: 'postlike.php',
            data: {'personId': personId, 'postId': postId},
            type: 'post',
            dataType : 'json',
        })
        .done(function(output) {
            if (output.added) {
                $totalLikes.html(parseInt($totalLikes.html())+1);
                var fontSize = $totalLikes.css('font-size');
                var color = $totalLikes.css('color');
                $totalLikes.css('color', 'red');
                $totalLikes.animate({'fontSize': "+=10px"}, 300)
                           .animate({'fontSize': fontSize}, 300, function(){
                                $totalLikes.css('color', color);
                           });
                // $totalLikes.css('color', color);

                // alert("Thank you");
            }
        })
        .fail(function(output) {
            alert("You already liked this post");
        });
    });

    $('.comment').click(function(e) {
        e.preventDefault();
        var personId = $(this).parent().find("[name='personId']").val();
        var postId = $(this).parent().find("[name='postId']").val();
        if ( $addComment = $('#addComment') ) {
            $addComment.remove();
        }
        $(this).parent().append("<section id='addComment' class='new-post'><h2>Add a comment</h2><form id='addCommentForm' action='' method='post' class='clearFix'><textarea id='new-comment-content' cols='20' rows='10'></textarea><input type='submit' name='new-comment-submit' value='Send' /> </form></section>");
        $('#addCommentForm').submit(function(e) {
            e.preventDefault();
            var comment = $('#new-comment-content').val();

            $.ajax({
                url: 'add-comment.php',
                data: {'personId': personId, 'postId': postId, 'comment': comment},
                type: 'post',
                dataType : 'json',
            })
            .done(function(output) {
                if (output.added) {
                    window.location.replace("news-feed.php");
                }
                else {
                    $('#addComment').remove();
                }
            })
            .fail(function(output) {
                alert("You can't commente on this post with this content");
            });

        });
    });
});
