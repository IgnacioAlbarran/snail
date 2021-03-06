require_relative 'snail'
require 'byebug'

describe 'snail' do
  let(:array) { [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12], [13, 14, 15, 16]] }
  let(:big_array) do
    [[1, 2, 3, 4, 5, 6], [20, 21, 22, 23, 24, 7], [19, 32, 33, 34, 25, 8],
     [18, 31, 36, 35, 26, 9], [17, 30, 29, 28, 27, 10],
     [16, 15, 14, 13, 12, 11]]
  end

  let(:huge_array) do
    [[54, 741, 498, 597, 258, 63, 478, 20, 47, 728, 197, 677, 52, 770],
    [179, 656, 265, 373, 31, 959, 567, 765, 881, 834, 485, 223, 990, 784],
    [847, 353, 375, 825, 231, 128, 138, 158, 919, 235, 735, 207, 491, 217],
    [732, 868, 993, 515, 653, 931, 20, 264, 291, 832, 778, 767, 868, 457],
    [763, 868, 702, 352, 390, 483, 231, 415, 345, 92, 157, 529, 788, 749],
    [472, 265, 365, 972, 875, 371, 573, 697, 833, 39, 742, 780, 25, 610],
    [105, 71, 850, 642, 614, 995, 388, 42, 19, 276, 154, 254, 816, 228],
    [605, 598, 451, 369, 784, 616, 854, 325, 260, 231, 577, 982, 108, 105],
    [205, 268, 465, 491, 208, 963, 524, 356, 29, 202, 538, 819, 798, 654],
    [904, 915, 821, 466, 255, 747, 903, 493, 475, 986, 781, 436, 87, 30],
    [706, 676, 169, 470, 53, 660, 949, 7, 815, 461, 17, 279, 172, 232],
    [169, 475, 23, 39, 979, 123, 172, 1, 749, 399, 50, 136, 260, 999],
    [503, 278, 864, 89, 536, 842, 430, 813, 269, 516, 43, 262, 187, 157],
    [796, 817, 928, 964, 117, 746, 660, 695, 658, 551, 109, 653, 507, 656]]
  end

  it 'runs all along the first line til the end of the square' do
    expect(snail(array).take(4)).to eq([1, 2, 3, 4])
  end

  it 'continues going down the last column til the last row' do
    expect(snail(array).take(7)).to eq([1, 2, 3, 4, 8, 12, 16])
  end

  it 'goes all along the last row to the left' do
    expect(snail(array).take(10)).to eq([1, 2, 3, 4, 8, 12, 16, 15, 14, 13])
  end

  it 'continues upwards to the top' do
    expect(snail(array).take(12)).to eq([1, 2, 3, 4, 8, 12, 16, 15, 14, 13, 9, 5])
  end

  it 'turns right in the upper row' do
    expect(snail(array).take(14)).to eq([1, 2, 3, 4, 8, 12, 16, 15, 14, 13, 9, 5, 6, 7])
  end

  it 'finishes with the last remaining row' do
    expect(snail(array)).to eq([1, 2, 3, 4, 8, 12, 16, 15, 14, 13, 9, 5, 6, 7, 11, 10])
  end

  it 'can draw the snail in a bigger board' do
    expect(snail(big_array)).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13,
                                    14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24,
                                    25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35,
                                    36])
  end

  it 'can draw the snail on a massive board' do
    expect(snail(huge_array)).to eq(
      [54, 741, 498, 597, 258, 63, 478, 20, 47, 728, 197, 677, 52, 770, 784, 217,
       457, 749, 610, 228, 105, 654, 30, 232, 999, 157, 656, 507, 653, 109, 551,
       658, 695, 660, 746, 117, 964, 928, 817, 796, 503, 169, 706, 904, 205, 605,
       105, 472, 763, 732, 847, 179, 656, 265, 373, 31, 959, 567, 765, 881, 834,
       485, 223, 990, 491, 868, 788, 25, 816, 108, 798, 87, 172, 260, 187, 262,
       43, 516, 269, 813, 430, 842, 536, 89, 864, 278, 475, 676, 915, 268, 598,
       71, 265, 868, 868, 353, 375, 825, 231, 128, 138, 158, 919, 235, 735, 207,
       767, 529, 780, 254, 982, 819, 436, 279, 136, 50, 399, 749, 1, 172, 123,
       979, 39, 23, 169, 821, 465, 451, 850, 365, 702, 993, 515, 653, 931, 20,
       264, 291, 832, 778, 157, 742, 154, 577, 538, 781, 17, 461, 815, 7, 949,
       660, 53, 470, 466, 491, 369, 642, 972, 352, 390, 483, 231, 415, 345, 92,
       39, 276, 231, 202, 986, 475, 493, 903, 747, 255, 208, 784, 614, 875, 371,
       573, 697, 833, 19, 260, 29, 356, 524, 963, 616, 995, 388, 42, 325, 854])
  end
end