import "package:equatable/equatable.dart";
abstract class SwitchEvents{

  SwitchEvents();
  @override
 List<Object>get props =>[];
}
class EnableOrDisableNotification extends SwitchEvents{}
class SliderEvents extends SwitchEvents{
  final double newValue;
  SliderEvents({required this.newValue});

  @override
  // TODO: implement props
  List<Object> get props => [newValue];

}
