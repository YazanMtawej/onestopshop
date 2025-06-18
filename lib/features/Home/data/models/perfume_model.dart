import 'package:equatable/equatable.dart';

class PerfumeModel extends Equatable {
	final int? id;
	final List<dynamic>? reviews;
	final String? name;
	final String? discription;
	final String? price;
	final String? brand;
	final String? category;
	final String? rating;
	final int? stock;
	final DateTime? createdAt;
	final int? releaseYear;
	final String? perfumer;
	final String? concertration;
	final String? topNotes;
	final String? heartNotes;
	final String? baseNotes;
	final String? fragranceFamily;
	final int? bottleSize;
	final String? longevity;
	final String? sillage;
	final String? picture;
	final int? user;

	const PerfumeModel({
		this.id, 
		this.reviews, 
		this.name, 
		this.discription, 
		this.price, 
		this.brand, 
		this.category, 
		this.rating, 
		this.stock, 
		this.createdAt, 
		this.releaseYear, 
		this.perfumer, 
		this.concertration, 
		this.topNotes, 
		this.heartNotes, 
		this.baseNotes, 
		this.fragranceFamily, 
		this.bottleSize, 
		this.longevity, 
		this.sillage, 
		this.picture, 
		this.user, 
	});

	factory PerfumeModel.fromJson(Map<String, dynamic> json) => PerfumeModel(
				id: json['id'] as int?,
				reviews: (json['reviews'] as List<dynamic>?)?.cast<String>(),
				name: json['name'] as String?,
				discription: json['discription'] as String?,
				price: json['price'] as String?,
				brand: json['brand'] as String?,
				category: json['category'] as String?,
				rating: json['rating'] as String?,
				stock: json['stock'] as int?,
				createdAt: json['createdAt'] == null
						? null
						: DateTime.parse(json['createdAt'] as String),
				releaseYear: json['release_year'] as int?,
				perfumer: json['perfumer'] as String?,
				concertration: json['concertration'] as String?,
				topNotes: json['top_notes'] as String?,
				heartNotes: json['heart_notes'] as String?,
				baseNotes: json['base_notes'] as String?,
				fragranceFamily: json['fragrance_family'] as String?,
				bottleSize: json['bottle_size'] as int?,
				longevity: json['longevity'] as String?,
				sillage: json['sillage'] as String?,
				picture: json['picture'] as String?,
				user: json['user'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'reviews': reviews,
				'name': name,
				'discription': discription,
				'price': price,
				'brand': brand,
				'category': category,
				'rating': rating,
				'stock': stock,
				'createdAt': createdAt?.toIso8601String(),
				'release_year': releaseYear,
				'perfumer': perfumer,
				'concertration': concertration,
				'top_notes': topNotes,
				'heart_notes': heartNotes,
				'base_notes': baseNotes,
				'fragrance_family': fragranceFamily,
				'bottle_size': bottleSize,
				'longevity': longevity,
				'sillage': sillage,
				'picture': picture,
				'user': user,
			};

	@override
	List<Object?> get props {
		return [
				id,
				reviews,
				name,
				discription,
				price,
				brand,
				category,
				rating,
				stock,
				createdAt,
				releaseYear,
				perfumer,
				concertration,
				topNotes,
				heartNotes,
				baseNotes,
				fragranceFamily,
				bottleSize,
				longevity,
				sillage,
				picture,
				user,
		];
	}
}
