import hashlib
import qrcode
import random
import os


def create_qr_code(data, img_name):
    qr = qrcode.QRCode(
    version=1,
    error_correction=qrcode.constants.ERROR_CORRECT_H,
    box_size=10,
    border=2,
    )
    
    qr.add_data(data + '\n\nPROPERTY OF ????')
    qr.make(fit=True)
    img = qr.make_image()
    img.save(img_name + '.png')

if __name__ == "__main__":

    # Creates serial numbers
    for i in range(100):
        ob = hashlib.sha3_256(str(i+random.getrandbits(512)).encode('utf-8')).hexdigest()
        create_qr_code(ob, str(i))
