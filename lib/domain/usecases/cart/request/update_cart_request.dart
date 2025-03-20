class UpdateCartRequest {
  final bool isIncrease;
  final String id;

  const UpdateCartRequest({required this.id, required this.isIncrease});
}
