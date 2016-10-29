using Toybox.WatchUi as Ui;
using Toybox.Graphics as Gfx;

class BikeFieldsView extends Ui.DataField {

    function initialize() {
        DataField.initialize();
    }
    var utils ;
	hidden var field1;
    hidden var field2;
    hidden var field3;

    //! Set your layout here. Anytime the size of obscurity of
    //! the draw context is changed this will be called.
    function onLayout(dc) {
    	
        var obscurityFlags = DataField.getObscurityFlags();

	    View.setLayout(Rez.Layouts.MainLayout(dc));
	    //CurTime
	    //Field 1
	    var label1View = View.findDrawableById("field1Label");
	    label1View.locY = label1View.locY - 16;
	    var value1View = View.findDrawableById("field1Value");
	    value1View.locY = value1View.locY + 7;
        View.findDrawableById("field1Label").setText(Rez.Strings.field1Label);
        //Field 2
        var label2View = View.findDrawableById("field2Label");
	    label2View.locY = label2View.locY - 16;
	    var value2View = View.findDrawableById("field2Value");
	    value2View.locY = value2View.locY + 7;
        View.findDrawableById("field2Label").setText(Rez.Strings.field2Label);
        //Field 3
        var label3View = View.findDrawableById("field3Label");
	    label3View.locY = label3View.locY - 16;
	    var value3View = View.findDrawableById("field3Value");
	    value3View.locY = value3View.locY + 7;
        View.findDrawableById("field3Label").setText(Rez.Strings.field3Label);

    }
    
   
	
	
    //! The given info object contains all the current workout
    //! information. Calculate a value and save it locally in this method.
    function compute(info) {
    	utils = new Utils(info);
        // field 1
       	field1 = utils.getSpeed();
        //Field 2
        field2 = utils.getBPM();
        //Field 3
        field3 =  utils.getRestingHeartRate();
    }

    //! Display the value you computed here. This will be called
    //! once a second when the data field is visible.
    function onUpdate(dc) {
        // Set the background color
        View.findDrawableById("Background").setColor(getBackgroundColor());
		//FIELD 1
        // Set the foreground color and value
        var field1Value = View.findDrawableById("field1Value");
        if (getBackgroundColor() == Gfx.COLOR_BLACK) {
            field1Value.setColor(Gfx.COLOR_WHITE);
        } else {
            field1Value.setColor(Gfx.COLOR_BLACK);
        }
 		field1Value.setText(Lang.format("$1$", [field1]));
 		
 		//FIELD 2
        // Set the foreground color and value
        var field2Value = View.findDrawableById("field2Value");
        if (getBackgroundColor() == Gfx.COLOR_BLACK) {
            field2Value.setColor(Gfx.COLOR_WHITE);
        } else {
            field2Value.setColor(Gfx.COLOR_BLACK);
        }
 		field2Value.setText(Lang.format("$1$", [field2]));
 		
 		//FIELD 2
        // Set the foreground color and value
        var field3Value = View.findDrawableById("field3Value");
        if (getBackgroundColor() == Gfx.COLOR_BLACK) {
            field3Value.setColor(Gfx.COLOR_WHITE);
        } else {
            field3Value.setColor(Gfx.COLOR_BLACK);
        }
 		field3Value.setText(Lang.format("$1$", [field3]));
        // Call parent's onUpdate(dc) to redraw the layout
        View.onUpdate(dc);
    }

}
