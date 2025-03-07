class UpdateCartRequest {
  final bool isIncrease;
  final int id;

  const UpdateCartRequest({required this.id, required this.isIncrease});
}
