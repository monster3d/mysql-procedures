CREATE DEFINER=`root`@`localhost` FUNCTION `test`.`GDistance`(`@oLat` FLOAT, `@oLon` FLOAT, `@dLat` FLOAT, `@dLon` FLOAT ) RETURNS int(11)
    NO SQL
BEGIN
						RETURN ROUND(
							(
								ACOS(
									SIN(`@dLat` * PI() / 180) *
									SIN(`@oLat` * PI() / 180) +
									COS(`@dLat` * PI() / 180) *
									COS(`@oLat` * PI() / 180) *
									COS((`@dLon` - `@oLon`) * PI() / 180)
								) *
								180 / PI()
							) *
							60 *
							1.1515 *
							1609.344
						);
						END