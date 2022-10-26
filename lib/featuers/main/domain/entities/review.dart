import 'package:equatable/equatable.dart';

class Review extends Equatable {

  final String reviewId;
  final String reviewerName;
  final double reviewerRate;
  final String reviewerId;
  final String reviewDate;
  final String reviewerImageUrl;

  const Review({
    required this.reviewId,
    required this.reviewerName,
    required this.reviewerRate,
    required this.reviewerId,
    required this.reviewDate,
    required this.reviewerImageUrl,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        reviewId,
        reviewerName,
        reviewerRate,
        reviewerId,
        reviewDate,
        reviewerImageUrl,
      ];
}
