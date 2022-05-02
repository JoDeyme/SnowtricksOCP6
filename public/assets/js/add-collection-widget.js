// add-collection-widget.js

jQuery(document).ready(function () {

    $(".remove-on-click").click(function () {
        removeOnClick(this);
    });





    $("#wrapper").on("change", "input", function () {
        console.log("uploaded");
    });


    jQuery('.add-another-collection-widget').click(function (e) {
        var list = jQuery(jQuery(this).attr('data-list-selector'));
        // Try to find the counter of the list or use the length of the list
        var counter = list.data('widget-counter') || list.children().length;
        // grab the prototype template
        var newWidget = list.attr('data-prototype');
        // replace the "__name__" used in the id and name of the prototype
        // with a number that's unique to your emails
        // end name attribute looks like name="contact[emails][2]"
        newWidget = newWidget.replace(/__name__/g, counter);

        counter++;
        // And store it, the length cannot be used if deleting widgets is allowed
        list.data('widget-counter', counter);


        jQuery(newWidget).addClass("removeOnClick");
        var inputWidget = '<div>' + newWidget + '</div>';
        var newElem = jQuery(list.attr('data-widget-videos')).html(inputWidget);

        // Increase the counter
        old = counter - 1;
        jQuery("#trick_form_videos_" + old).attr("disabled", true);


        // create a new list element and add it to the list
        jQuery(list.append(newElem));
        jQuery('.remove-on-click').bind("click", function () {
            removeOnClick(this);
        });
    });

    function removeOnClick(buttonClicked) {
        var currentInput = jQuery(jQuery(buttonClicked).attr('data-widget-id'));
        var currentButtonId = $(buttonClicked).attr('id');
        var recup = currentButtonId.replace("_remove", "");

        $("#" + recup).remove();
        buttonClicked.remove();


        /* jQuery(buttonClicked).remove();
        jQuery(currentInput).remove(); */
    }

});

