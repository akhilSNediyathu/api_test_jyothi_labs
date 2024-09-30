String? validatefields(String? title) {
  if (title == null || title.isEmpty) {
    return 'Task title is required.'; 
  }
  return null; 
} 