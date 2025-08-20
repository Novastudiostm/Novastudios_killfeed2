var $KillFeed = $('.kill-feed');
var $KillFeedElement = $('.kill-feed > div').hide();

function AddToKillFeed(Layout) {
    var $ThisKill = $KillFeedElement.clone();
    $ThisKill.find('.kill-text').html(`${Layout}`);
    $KillFeed.append($ThisKill.show().delay(3000).fadeOut(500, function() {
        $(this).remove()
    }))
}

$(function () {
    $(document).on("contextmenu", function(e) {
        e.preventDefault()
    });

    window.addEventListener('message', function(event) {
        if (event.data.type === 'showKillfeed') {
            AddToKillFeed(event.data.Layout);
        }
    });
});
