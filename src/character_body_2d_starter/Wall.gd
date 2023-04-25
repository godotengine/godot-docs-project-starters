extends StaticBody2D

func hit():
	$AnimationPlayer.play('flash')