module ApplicationHelper
  def label_class
    'block text-sm font-medium text-gray-700'
  end

  def input_class
    'block w-full appearance-none rounded-md border border-gray-300 px-3 py-2 placeholder-gray-400 shadow-sm
        focus:border-indigo-500 focus:outline-none focus:ring-indigo-500 sm:text-sm'
  end

  def select_class
    'form-select appearance-none block w-full px-3 py-1.5 text-base font-normal text-gray-700
        bg-white bg-clip-padding bg-no-repeat border border-solid border-gray-300 rounded transition
        ease-in-out m-0 focus:text-gray-700 focus:bg-white focus:border-blue-600 focus:outline-none'
  end

  def form_button_class
    # 'flex w-full justify-center rounded-md border border-transparent bg-indigo-600 py-2 px-4 text-sm font-medium
    # text-white shadow-sm hover:bg-indigo-700
    # focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2'
    'flex w-full justify-center rounded-lg  bg-lightBlue text-white hover:bg-darkBlue font-bold
        py-2 px-4 focus:outline-none focus:ring-2 focus:ring-darkBlue focus:ring-offset-2'
  end

  def save_button_class
    # 'flex w-full justify-center rounded-md border border-transparent bg-indigo-600 py-2 px-4 text-sm font-medium
    # text-white shadow-sm hover:bg-indigo-700
    # focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2'
    'flex w-full justify-center rounded-lg uppercase  bg-lightGreen text-white hover:bg-darkGreen font-bold
        py-2 px-4 focus:outline-none focus:ring-2 focus:ring-darkBlue focus:ring-offset-2'
  end
end
