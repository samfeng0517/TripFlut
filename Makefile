get:
	flutter pub get

clean:
	flutter clean

gen:
	flutter pub run build_runner build --delete-conflicting-outputs
