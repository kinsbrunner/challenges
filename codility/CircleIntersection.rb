

def solution(a)
  
	n = a.length


	return 0 if n<2

	numIntersecs = n * (n - 1) / 2 #unordered pairs, initialized to max possible

	hiVals = Array.new
	loVals = Array.new



	(0..n-1).each do |i|
    
		hiVals[i] = i + a[i] #high value of disk edge (along x-axis)

		loVals[i] = i - a[i] #low value of disk edge (along x-axis)

	end


	hiVals.sort!
	loVals.sort!
	jLo = 0 #initialize inner iterator only once


	(0..n-1).each do |iHi|
		while jLo < n #nested, but only cycled thru once (or twice, sorta)

			if (loVals[jLo] > hiVals[iHi])  #disks don't intersect if one's lo > other's hi

				numIntersecs -= n - jLo  #decrement by the num of lo values > this hi value

				break  #don't increment iterator, check this low value again next time

			end

			jLo += 1
		end

		break if jLo == n  #no more low values > high values

	end


	return -1 if (numIntersecs > 10000000)

	numIntersecs

end