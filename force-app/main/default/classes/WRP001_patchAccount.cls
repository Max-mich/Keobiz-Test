public class WRP001_patchAccount {

	public String id;
	public Boolean is_active;

	
	public static WRP001_patchAccount parse(String json) {
		return (WRP001_patchAccount) System.JSON.deserialize(json, WRP001_patchAccount.class);
	}
}