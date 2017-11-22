function recall=calculate_recall(Y,Y_validation)

	Y_size=length(Y);
	total_positive_count=0;
	total_true_positive_count=0;
	for i=1:Y_size
		if Y(i)==1 && Y_Validation(i)==1
			total_true_positive_count=total_true_positive_count+1;
		end
		if Y(i)==1
			total_positive_count=total_positive_count+1;
		end
	end

	recall=total_true_positive_count/total_positive_count;

end