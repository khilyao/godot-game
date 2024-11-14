extends Button

var tween: Tween

var normal_color: Color = Color8(224, 224, 224) 
var hover_color: Color = Color8(255, 255, 255)

func _ready():
	tween = Tween.new()
	add_child(tween)

	modulate = normal_color
	
	connect("mouse_entered", self, "_on_mouse_entered")
	connect("mouse_exited", self, "_on_mouse_exited")

func _on_mouse_entered():
	tween.stop_all()
	tween.interpolate_property(self, "modulate", modulate, hover_color, 0.3, Tween.TRANS_SINE, Tween.EASE_OUT)
	tween.start()

func _on_mouse_exited():
	tween.stop_all()
	tween.interpolate_property(self, "modulate", modulate, normal_color, 0.3, Tween.TRANS_SINE, Tween.EASE_OUT)
	tween.start()
