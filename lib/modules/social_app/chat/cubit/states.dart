abstract class ChatStates {}

class ChatInitState extends ChatStates {}

class ChatGetMessagesLoadingState extends ChatStates {}

class ChatGetMessagesSuccessState extends ChatStates {}

class ChatSendMessageLoadingState extends ChatStates {}

class ChatSendMessageSuccessState extends ChatStates {}

class ChatSendMessageErrorState extends ChatStates {}