enum SelectorType { thrand, popular, free }

class ScrollableMoviesSectionsHelper {
  static List<String> getSelectionFromType(SelectorType type) {
    if (type == SelectorType.thrand) {
      return ['Сегодня', 'На этой неделе'];
    } else {
      return ['Другое'];
    }
  }

  static String getTitleFromType(SelectorType type) {
    switch (type) {
      case SelectorType.thrand:
        return 'В тренде';
      case SelectorType.popular:
        return 'Что популярно';
      case SelectorType.free:
        return 'Бесплатное';
    }
  }

  static List<String> getDropdownTitlesFromType(SelectorType type) {
    switch (type) {
      case SelectorType.thrand:
        return ['Сегодня', 'На этой неделе'];
      case SelectorType.popular:
        return ['Онлайн', 'По ТВ', 'Напрокат', 'В кинотеатрах'];
      case SelectorType.free:
        return ['Фильмы', 'Сериалы'];
    }
  }
}
