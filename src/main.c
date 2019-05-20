/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jfortin <jfortin@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/05/01 15:37:11 by jfortin           #+#    #+#             */
/*   Updated: 2019/05/20 16:47:05 by jfortin          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "git-train.h"

int	main(void)
{
	int	mysterious_nbr = 0;
	int	input = 0;
	int	tries = 0;

	// generate random number

	srand(time(NULL));
	mysterious_nbr = (rand() % (MAX - MIN + 1)) + MIN;

	/* game loop */

	do
	{
		// ask the number
		printf("What is the number ? ");
		scanf("%d", &input);

		// increment tries
		tries++;

		// compare the two numbers
		if (mysterious_nbr > input)
			printf("It's more !\n\n");
		else if (mysterious_nbr < input)
			printf("It's less !\n\n");
		else
			printf ("Congratulation, you found the mysterious number in %d tries !!!\n\n", tries);
	} while (input != mysterious_nbr);
	
	return (EXIT_SUCCESS);
}